FROM ubuntu:18.04

ENV PRPJECT_DIR /home/wwwroot
ENV PHP_VERSION 7.2

ENV TZ Europe/Paris

RUN apt-get update
RUN apt-get install -y git curl wget acl zip unzip locales \
	    apt-transport-https ca-certificates software-properties-common \
	    apache2 libxml2

# Paramètres de langue et de timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN locale-gen fr_FR fr_FR.UTF-8 en_US en_US.UTF-8
RUN echo "export LC_ALL=fr_FR" >> /etc/apache2/envvars
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL fr_FR

RUN add-apt-repository -y ppa:ondrej/php && apt-get update

RUN apt-get install -y --no-install-recommends php$PHP_VERSION libapache2-mod-php$PHP_VERSION \
		php$PHP_VERSION-mysql php$PHP_VERSION-curl php$PHP_VERSION-json php$PHP_VERSION-gd php$PHP_VERSION-msgpack \
		php$PHP_VERSION-memcached php$PHP_VERSION-intl php$PHP_VERSION-sqlite3 php$PHP_VERSION-gmp php$PHP_VERSION-geoip php$PHP_VERSION-mbstring \
		php$PHP_VERSION-redis php$PHP_VERSION-xml php$PHP_VERSION-zip php$PHP_VERSION-bcmath

# Config spécifique
WORKDIR $PRPJECT_DIR

COPY vhosts/000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY php.ini /etc/php/$PHP_VERSION/apache2/php.ini

COPY scripts/init.sh /usr/bin/init.sh
RUN chmod +x /usr/bin/init.sh

RUN a2enmod headers
RUN a2enmod rewrite
RUN a2enmod expires
RUN a2enmod deflate
RUN a2enmod vhost_alias

EXPOSE 80

ENTRYPOINT init.sh
