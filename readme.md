naroga/gitlab-runner-php56
============

This image extends the default gitlab runner, adding Apache 2.4, PHP 5.6 and lots of extensions and packages.

Installing this image
---------------------

**1) Pulling from the hub (recommended)**

To pull the latest version from image from the hub, just execute `docker pull naroga/php56`.

**2) Building from the Dockerfile**

To build from the Dockerfile, you can download the raw Dockerfile from this repository, or you can clone
this repository entirely and build from it.

2.1) Downloading the Dockerfile

Get the [Dockerfile](https://raw.githubusercontent.com/naroga/docker-php56/master/Dockerfile) here, and put it in a folder:

    mkdir naroga-php-56
    cd naroga-php-56
    wget https://rawgithubusercontent.com/naroga/docker-php56/master/Dockerfile
    docker build -t naroga/php56 .

2.2) Cloning the repository:

Clone this repository:

    git clone https://github.com/naroga/docker-php56 naroga-php-56

Now, build the image from the cloned folder:
  
    cd naroga-php-56
    docker build -t naroga/php56 .

Running a job
-------------

To test if everything's working, run
    
    JOB=$(docker run -d naroga/php56 /bin/sh -c "php -v")
    docker logs $JOB

The previous snippet should display:

    PHP 5.6.4-ubuntu6.2 (cli) ...

If a newer version is displayed, don't worry. This image always installs the latest stable distribution.

Features
--------

OS: Ubuntu 14.04

PHP 5.6.4-ubuntu6.2

Apache 2.4.10, running on port 80.

Default extensions: "Core", "date","ereg","libxml","openssl","pcre","zlib","bcmath","bz2","calendar","ctype","dba","dom","hash","fileinfo","filter","ftp","gettext","SPL","iconv","mbstring","pcntl","session","posix","Reflection","standard","shmop","SimpleXML","soap","sockets","Phar","exif","sysvmsg","sysvsem","sysvshm","tokenizer","wddx","xml","xmlreader","xmlwriter","zip","json","readline","mhash", "Zend OPcache".

Additional extensions: "curl","intl", "apc", "apcu", "memcached","mysql","mysqli","pdo_mysql", "PDO".

Packages: curl, pear, wget, git, composer, phpunit, phpcs, memcached, mysql.

All packages are available from anywhere in the command line, i.e. `composer --version`, `phpunit --version`, `phpcs --version`. This is meant to help test projects without needing to add these packages as vendors in the `require-dev` section of `composer.json`.

This build brings a php.ini with most troublesome configuration already fixed (you will not get warnings for a missing default `date.timezone`, for example).

MySQL Server
------------

Running on default port (3306). User: "root" (no quotes). Password: "root" (no quotes).
