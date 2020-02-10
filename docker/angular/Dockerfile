FROM node:10

EXPOSE 4200

COPY scripts/init.sh /usr/bin/init.sh
RUN chmod +x /usr/bin/init.sh
ENTRYPOINT init.sh
