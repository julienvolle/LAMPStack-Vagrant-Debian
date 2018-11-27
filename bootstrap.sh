# Update default
sudo apt-get update
sudo apt-get upgrade

# Install Apache
sudo apt-get install -y apache2

# Config VHOST
VHOST=$(cat <<EOF
    <VirtualHost *:80>
      DocumentRoot "/var/www/html"
      ServerName local.dev
      <Directory "/var/www/html">
        AllowOverride All
        Require all granted
      </Directory>
    </VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-enabled/000-default.conf
sudo service apache2 restart

# Install PHP 5.6
# sudo apt-get install -y php5
# sudo apt-get install -y php5-cli
# sudo apt-get install -y php5-curl
# sudo apt-get install -y php5-mbstring
# sudo apt-get install -y php5-mysql
# sudo apt-get install -y zip unzip php5-zip
# sudo apt-get install -y libapache2-mod-php5
# sudo service apache2 restart

# Install PHP 7.1
sudo apt-get install -y ca-certificates 
sudo apt-get install -y apt-transport-https 
wget -q https://packages.sury.org/php/apt.gpg -O- | sudo apt-key add -
sudo echo "deb https://packages.sury.org/php/ jessie main" | tee /etc/apt/sources.list.d/php.list
sudo apt-get update
sudo apt-get install -y php7.1
sudo apt-get install -y php7.1-cli
sudo apt-get install -y php7.1-curl
sudo apt-get install -y php7.1-mbstring
sudo apt-get install -y php7.1-mysql
sudo apt-get install -y zip unzip php7.1-zip
sudo apt-get install -y libapache2-mod-php7.1
sudo service apache2 restart

# Install CURL
sudo apt-get install -y curl

# Install MySQL/MariaDB
# -> Basename: mydb
# -> Username: root
# -> Password: root
export DEBIAN_FRONTEND="noninteractive"
debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password root'
debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password root'
sudo apt-get install -y mariadb-server-10.0
sudo mysql -uroot -proot -e "CREATE DATABASE IF NOT EXISTS mydb;";
sudo mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';"
sudo mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root';"
sudo service mysql restart

# Install Git
sudo apt-get install -y git-core

# Install Composer
curl -s https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer
