#!/bin/bash

for folder in {"public","var/cache","var/logs/apache"}; do 
  mkdir -p "${PROJECT_DIR}/$folder"
done
# chown www-data:www-data "${PROJECT_DIR}"

apachectl  -DFOREGROUND -e info
