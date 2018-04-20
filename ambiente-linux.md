# Ambiente Linux - .deb

## Instalação de:

* Sublime-text-3
* Apache2
* php5.6 e php7.0
* Mysql
* Phpmyadmin
* Git
* Composer
* npm
* Gulp
* Sass

### INSTALANDO SUBLIME-TEXT-3

> wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -;

> sudo apt-get install apt-transport-https;

> echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list;

> sudo apt-get update;

> sudo apt-get install sublime-text


### INSTALANDO APACHE2


>sudo apt-get update;

>sudo apt-get install apache2;

##### Testando instalação:
##### acesse: http://127.0.0.1

#### Configurando Apache2, usuários e permissões


>sudo usermod -a -G www-data `whoami`;

>sudo service apache2 restart;

>sudo chown `whoami`:www-data /var/www/ -R;


##### abra o `000-default.conf` e substitua tudo por:

> sudo subl -e /etc/apache2/sites-available/000-default.conf;

	<VirtualHost *:80>
		ServerAdmin webmaster@localhost
		DocumentRoot /var/www
		<Directory /var/www/>
			Options FollowSymlinks Indexes MultiViews
			AllowOverride All
			Order allow,deny
			Allow from localhost
			Require all granted
		</Directory>
		ErrorLog ${APACHE_LOG_DIR}/error.log
		CustomLog ${APACHE_LOG_DIR}/access.log combined
	</VirtualHost>
	# vim: syntax=apache ts=4 sw=4 sts=4 sr noet


> sudo service apache2 restart;

##### crie o arquivo `/var/www/html/phpinfo.php` e insira:

> subl /var/www/html/phpinfo.php;

	<?php echo phpinfo();


### INSTALANDO PHP5.6 E 7.0

* php5.6

> sudo apt-get install python-software-properties;

> sudo add-apt-repository ppa:ondrej/php;

> sudo apt-get update;

> sudo apt-get install -y php5.6;

##### Testando versão do php no apache (`acesse: http://127.0.0.1/html/phpinfo.php`)

* php7.0

> sudo apt-get install python-software-properties;

> sudo add-apt-repository ppa:ondrej/php;

> sudo apt-get update;

> sudo apt-get install -y php7.0;

##### Testando versão do php no apache (`acesse: http://127.0.0.1/html/phpinfo.php`)

##### (`Mude para a versão que quiser, é opcional`) Alterar versão atual do php:

* php5.6 para php7.0

> sudo a2dismod php5.6;
> sudo a2enmod php7.0;
> sudo service apache2 restart;

##### (`Opcional`) CLI:-

	sudo update-alternatives --set php /usr/bin/php7.0;
	sudo update-alternatives --set phpize /usr/bin/phpize7.0;
	sudo update-alternatives --set php-config /usr/bin/php-config7.0;


* php7.0 para php5.6

> sudo a2dismod php7.0;
> sudo a2enmod php5.6;
> sudo service apache2 restart;

##### (`Opcional`) CLI:-

	sudo update-alternatives --set php /usr/bin/php5.6;
	sudo update-alternatives --set phpize /usr/bin/phpize5.6;
	sudo update-alternatives --set php-config /usr/bin/php-config5.6;

### Instalando bibliotecas do php

* php5.6

> sudo apt-get install php5.6-cgi php5.6-gd php5.6-intl php5.6-json php5.6-mbstring php5.6-mcrypt php5.6-mysql php5.6-soap php5.6-xml php5.6-xsl php5.6-xmlrpc php5.6-zip php5.6-curl php5.6-common  php5.6-bz2;

> sudo service apache2 restart;

* php7.0

> sudo apt-get install php7.0-bz2 php7.0-cgi php7.0-common php7.0-curl php7.0-gd php7.0-intl php7.0-json php7.0-mbstring php7.0-mcrypt php7.0-mysql php7.0-xml php7.0-xmlrpc php7.0-xsl php7.0-zip php7.0-soap;

> sudo service apache2 restart;

### INSTALANDO MYSQL

> sudo apt-get install update;

> sudo apt-get install mysql-server;

### INSTALANDO PHPMYADMIN

> sudo apt-get update;

> sudo apt-get install phpmyadmin;

### INSTALANDO GIT

> sudo apt-get update;

> sudo apt-get install git;

* Confgurando Git

> git config --global user.name "Pedro Lima"

> git config --global user.email pedro.lima@primage.com.br

* Gerando uma SSH Key

> ssh-keygen -t rsa // Não entre com nenhum valor, dê enter em tudo

> eval "$(ssh-agent -s)"; // `Se apareceu algo parecido com "Agent pid 214124" continue, se não é porque tem algo errado`;

> ssh-add ~/.ssh/id_rsa;

> cat ~/.ssh/id_rsa.pub; // Chave pública

> cat ~/.ssh/id_rsa; // Chave Privada

### INSTALANDO COMPOSER

> php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"

> php composer-setup.php --install-dir=/bin --filename=composer;

##### Testar composer:

> composer;

### INSTALANDO NODEJS, NODE, NPM, GULP-CLI

> sudo apt-get install nodejs

> sudo apt-get install node-legacy;

> sudo apt-get install npm; 

> sudo npm install -g gulp;

> sudo npm cache clean -f;

> sudo npm install -g n;

> sudo n 6.9.1;

### Habilitando rewrite do apache

> sudo a2enmod rewrite;

> sudo service apache2 restart;
