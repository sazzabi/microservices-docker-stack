#!/bin/bash

envs=`printenv`

for env in $envs
do
    IFS== read name value <<< "$env"

    sed -i "s|\${${name}}|${value}|g" /etc/varnish/default.vcl
done


exec varnishd -F -a :8000 -f /etc/varnish/default.vcl -s malloc,100M
