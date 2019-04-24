FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends varnish \
 && rm -rf /var/cache/apk/* 
ADD default.vcl /etc/varnish/

EXPOSE 8000
EXPOSE 6081
EXPOSE 6082

COPY scripts/init.sh /usr/bin/init.sh
RUN chmod +x /usr/bin/init.sh
ENTRYPOINT init.sh
