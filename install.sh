#!/bin/sh

color_empty='\033[0m'
color_green='\033[0;32m'
color_azul='\033[1;34m'

git_repo_docker="git@github.com:lima195/magento2-docker.git"
git_repo_magento="git@github.com:lima195/magento2-store.git"
git_repo_module="git@github.com:lima195/lima-newsletter.git"

project_dir='magento_test'

docker_db_user=magento
docker_db_pass=magento
docker_db_db=magento

echo "${color_green}Creating dirs${color_empty}";
mkdir ${project_dir};

echo "${color_green}Cloning docker${color_empty}";
git clone ${git_repo_docker} ${project_dir}/docker-magento2;
echo "${color_green}Cloning magento${color_empty}";
git clone ${git_repo_magento} ${project_dir}/magento2;
echo "${color_green}Cloning module${color_empty}";
git clone ${git_repo_module} ${project_dir}/module;

echo "${color_green}Copy module for magento${color_empty}";
mkdir ${project_dir}/magento2/app/code;
cp ${project_dir}/module/* ${project_dir}/magento2/app/code/ -R;

echo "${color_green}Setting Magento Conf${color_empty}";
cp ${project_dir}/magento2/auth.json.dev ${project_dir}/magento2/auth.json;
cp ${project_dir}/magento2/app/etc/env.php.dev ${project_dir}/magento2/app/etc/env.php;

cd ${project_dir}/docker-magento2;
echo "${color_green}Installing Docker Environment${color_empty}";
sudo docker-compose up -d --build;

echo "${color_green}Populating DB${color_empty}";
sudo docker exec -ti docker-magento2_web_1 sh -c "mysql -u magento -pmagento -h 172.22.0.110 magento < cd /var/www/html/mysql_dumps/magento.sql";

echo "${color_green}Installing missing php extension${color_empty}";
sudo docker exec -ti docker-magento2_web_1 sh -c "docker-php-ext-install bcmath;";

echo "${color_green}Restarting apache${color_empty}";
sudo docker exec -ti docker-magento2_web_1 sh -c "/etc/init.d/apache2 reload";

echo "${color_green}Composer install${color_empty}";
sudo docker exec -ti docker-magento2_web_1 sh -c "cd /var/www/html; composer install;";

echo "${color_green}Magento setup:upgrade${color_empty}";
sudo docker exec -ti docker-magento2_web_1 sh -c "cd /var/www/html; bin/magento setup:upgrade;";

echo "${color_green}Fixing Permissions${color_empty}";
sudo docker exec -ti docker-magento2_web_1 sh -c "cd /var/www/html; set-permissions";

echo "${color_green}Add docker apache IP to hosts${color_empty}";
sudo -- sh -c "echo '172.22.0.105 local.magento.com' >> /etc/hosts";

echo "${color_green}Done! You can access the magento project on: http://local.magento.com/${color_empty}";

# show db ip
# docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' docker-magento2_db_1

# exec apache_php docker
# docker exec -ti docker-magento2_web_1 bash

# remove all docker images and containers
# docker kill $(docker ps -q); docker rm $(docker ps -a -q); docker rmi $(docker images -q);