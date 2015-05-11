xconsul:
    image: progrium/consul
    hostname: consul
    ports:
        - "172.17.42.1:53:53/udp"
    command: -bootstrap-expect 1 -server -ui-dir /ui

registrator:
  image: gliderlabs/registrator:master
  links:
      - xconsul
  volumes:
      - /var/run/docker.sock:/tmp/docker.sock
  command: "-internal consul://xconsul:8500"

wordpress:
    build: wpred
    links:
        - mariadb:mysql
    volumes:
        - databox/html/:/var/www/html/
    environment:
        - WORDPRESS_DB_PASSWORD=DC_DBPASS
        - SERVICE_NAME=wp
        - Y_INSTALL_HOST=DC_EXTHOST
    ports:
        - 8280:80

mariadb:
    image: mariadb:10.0.17
    volumes:
        - databox/mysql/:/var/lib/mysql/
    environment:
        - MYSQL_ROOT_PASSWORD=DC_DBPASS

varnish:
    image: y12docker/varnish:4.0.3
    links:
        - wordpress
    environment:
        - VARNISH_PORT=80
        - Y_VARNISH_BACKEND_PORT=80
        - Y_VARNISH_BACKEND_HOST=wordpress
        - SERVICE_NAME=varnish
    ports:
        - 8180:80
nginx:
    build: nginx
    links:
        - varnish
    environment:
        - SERVICE_NAME=nginx
        - Y_NGINX_SERVER_NAME=DC_EXTHOST
        - Y_NGINX_SERVER_PORT=80
        - Y_VARNISH_HOST=varnish
        - Y_VARNISH_PORT=80
    ports:
        - 80:80
