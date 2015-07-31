FROM gitlab/gitlab-runner
MAINTAINER Pedro Cordeiro <pedro@naroga.com.br>

#Updates apt repository
RUN apt-get update -y

#Installs PHP5.6, some extensions and apcu.
RUN apt-get install -y php5 php5-mysql php5-curl php5-intl php5-memcached php5-apcu

#Installs curl, pear, wget, git, memcached and mysql-server
RUN apt-get install -y curl php-pear wget git memcached

#Installs PHPUnit
RUN wget https://phar.phpunit.de/phpunit.phar 
RUN chmod +x phpunit.phar 
RUN mv phpunit.phar /usr/local/bin/phpunit

#Installs Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Installs PHP CodeSniffer
RUN pear install PHP_CodeSniffer

#Fetches a sample php.ini file with most configurations already good-to-go.
RUN wget https://raw.githubusercontent.com/naroga/gitlab-runner-php56/master/php.ini
RUN rm -r /etc/php5/cli/php.ini
RUN rm -r /etc/php5/apache2/php.ini
RUN cp php.ini /etc/php5/cli/php.ini 
RUN cp php.ini /etc/php5/apache2/php.ini 

#Installing MySQL Server
RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
RUN apt-get install -y mysql-server

#Tests build
RUN php -v
RUN phpunit --version
RUN composer --version
RUN phpcs --version
RUN php -i | grep timezone
RUN php -r "echo json_encode(get_loaded_extensions());"
