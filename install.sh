#!/bin/sh

color_empty='\033[0m'
color_green='\033[0;32m'
color_azul='\033[1;34m'

git_repo_docker="git@github.com:lima195/magento2-docker.git"
git_repo_magento="git@github.com:lima195/magento2-store.git"
git_repo_module="git@github.com:lima195/lima-newsletter.git"

sudo mkdir /var/www/;
sudo chown $USER: /var/www/;
project_dir='magento_test'
project_path='/var/www/'${project_dir}

docker_db_ip='172.18.0.3'
docker_apache_ip='172.18.0.5'

docker_db_user=magento
docker_db_pass=magento
docker_db_db=magento

echo "${color_green}Creating dirs${color_empty}";
cd /var/www/;
mkdir ${project_dir};
cd ${project_path};

echo "${color_green}Cloning docker${color_empty}";
git clone ${git_repo_docker} docker-magento2;
echo "${color_green}Cloning magento${color_empty}";
git clone ${git_repo_magento} magento2;
echo "${color_green}Cloning module${color_empty}";
git clone ${git_repo_module};

echo "${color_green}Copy module for magento${color_empty}";
mkdir magento2/app/code;
cp ${project_path}/lima-newsletter/* ${project_path}/magento2/app/code/ -R;

echo "${color_green}Installing Docker Environment${color_empty}";
cd ${project_path}/docker-magento2;
docker-compose up -d --build;

echo "${color_green}Setting Magento Conf${color_empty}";
cp ${project_path}/magento2/auth.json.dev ${project_path}/magento2/auth.json;
cp ${project_path}/magento2/app/etc/env.php.dev ${project_path}/magento2/app/etc/env.php;

cd ${project_path}/docker-magento2;
echo "${color_green}Populating DB${color_empty}";
docker exec -ti docker-magento2_web_1 sh -c "cd /var/www/html/mysql_dumps/; mysql -u magento -pmagento -h docker-magento2_db_1 magento < magento.sql";
echo "${color_green}Installing missing php extension${color_empty}";
docker exec -ti docker-magento2_web_1 sh -c "docker-php-ext-install bcmath;";
echo "${color_green}Restarting apache${color_empty}";
docker exec -ti docker-magento2_web_1 sh -c "/etc/init.d/apache2 reload";
echo "${color_green}Composer install${color_empty}";
docker exec -ti docker-magento2_web_1 sh -c "cd /var/www/html; composer install;";
echo "${color_green}Magento setup:upgrade${color_empty}";
docker exec -ti docker-magento2_web_1 sh -c "cd /var/www/html; bin/magento setup:upgrade;";
echo "${color_green}Fixing Permissions${color_empty}";
docker exec -ti docker-magento2_web_1 sh -c "cd /var/www/html; set-permissions";

echo "${color_green}Add docker apache IP to hosts${color_empty}";
sudo -- sh -c "echo 'docker-magento2_web_1 local.magento.com' >> /etc/hosts";

# echo "${color_azul}========================================Warning=======================================${color_empty}";
# echo "${color_azul}If you get any SQL error, the reason should be wrong MYSQL docker IP, the right IP is:${color_empty}";
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' docker-magento2_db_1;
# echo "${color_azul}Run the next command with the correct IP:${color_empty}";
# echo 'docker exec -ti docker-magento2_web_1 sh -c "cd /var/www/html/mysql_dumps/; mysql -u magento -pmagento -h 172.18.0.3 magento < magento.sql";';
# echo "${color_azul}Update your magento2/app/etc/env.php with the wright MYSQL IP${color_empty}";
# echo "${color_azul}Run:${color_empty}";
# echo 'docker exec -ti docker-magento2_web_1 sh -c "cd /var/www/html; chmod +x bin/magento; bin/magento setup:upgrade;";';
# echo "${color_azul}Run:${color_empty}";
# echo 'docker exec -ti docker-magento2_web_1 sh -c "cd /var/www/html; set-permissions";';
# echo "${color_azul}========================================Done=======================================${color_empty}";

echo "${color_green}Done! You can access the magento project on: http://local.magento.com/${color_empty}";

# show db ip
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' docker-magento2_db_1

# exec apache_php docker
# docker exec -ti docker-magento2_web_1 bash

# remove all docker images and containers
# docker kill $(docker ps -q); docker rm $(docker ps -a -q); docker rmi $(docker images -q);