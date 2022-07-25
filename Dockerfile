FROM ubuntu:20.04
COPY server/ubuntu-focal-aliyun.list /etc/apt/sources.list

RUN apt-get update -y && apt-get upgrade -y 

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y tzdata \
    && ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

RUN apt-get install -y nano vim git curl wget zip htop apt-utils dialog lsof
RUN apt-get install -y lsb-release software-properties-common libzstd-dev libcurl4-openssl-dev libgraphviz-dev

RUN add-apt-repository -y ppa:ondrej/php && \
    apt-get update -y 

RUN apt-get install -y php8.1-common php8.1-cli php8.1-bcmath php8.1-dev php8.1-xml php8.1-opcache php8.1-mbstring php8.1-mysql php8.1-fpm php8.1-gd php8.1-zip php8.1-curl php8.1-intl


RUN sed -i 's/display_errors = Off/display_errors = On/' /etc/php/8.1/fpm/php.ini 
RUN sed -i 's/listen = \/run\/php\/php8\.1-fpm\.sock/listen = 0\.0\.0\.0\:9000/' /etc/php/8.1/fpm/pool.d/www.conf

RUN apt-get install -y  php8.1-msgpack php8.1-igbinary php8.1-apcu php8.1-xdebug php8.1-amqp php8.1-redis php8.1-xhprof 
RUN apt-get install -y mysql-server
RUN apt-get install -y nginx


RUN pecl channel-update pecl.php.net
RUN pecl install seaslog 
RUN pecl install yaf 
RUN pecl install inotify
RUN pecl install apcu

RUN echo '[yaf]' >> /etc/php/8.1/fpm/php.ini && \
    echo 'extension=yaf' >> /etc/php/8.1/fpm/php.ini && \
    echo 'yaf.environ=product' >> /etc/php/8.1/fpm/php.ini && \
    echo 'yaf.cache_config=1' >> /etc/php/8.1/fpm/php.ini && \
    echo 'yaf.use_namespace=1' >> /etc/php/8.1/fpm/php.ini && \
    echo 'yaf.use_spl_autoload=1' >> /etc/php/8.1/fpm/php.ini

RUN curl -sS https://install.phpcomposer.com/installer | php && \
	mv composer.phar /usr/local/bin/composer && \
	composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

ADD server/mysql.sh /root/
ADD install.sql /root/
RUN chmod +x /root/mysql.sh
RUN /root/mysql.sh

COPY server/start.sh /root/start.sh
RUN chmod +x /root/start.sh
WORKDIR /root
ENTRYPOINT /root/start.sh && tail -f /dev/null

RUN apt-get clean && apt-get autoclean 

# 镜像信息
LABEL Author="Hobby"
LABEL Version="2022.7"
LABEL Description="One-Page Ubuntu环境镜像 "