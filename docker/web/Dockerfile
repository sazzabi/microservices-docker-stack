FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y git curl wget acl zip unzip locales \
	    apt-transport-https ca-certificates software-properties-common \
	    apache2 libxml2

COPY vhosts/000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN a2enmod proxy_fcgi ssl rewrite proxy proxy_balancer proxy_http proxy_ajp headers rewrite expires deflate vhost_alias

EXPOSE 80 443

COPY scripts/init.sh /usr/bin/init.sh
RUN chmod +x /usr/bin/init.sh
ENTRYPOINT init.sh
