#!/bin/bash
DC_DBPASS=`openssl rand -base64 10 | tr -d '+=/'`
DC_EXTHOST=localhost
read -e -p "Hostname/Ip Address [${DC_EXTHOST}]: " -i "${DC_EXTHOST}" DC_EXTHOST
read -e -p "Database Password [${DC_DBPASS}]: " -i "${DC_DBPASS}" DC_DBPASS
cp -f docker-compose.yml.tpl docker-compose.yml

for name in $(compgen -v DC_); do
    eval value=\$$name
    sed -i "s|${name}|${value}|g" docker-compose.yml
done

diff docker-compose.yml.tpl docker-compose.yml
