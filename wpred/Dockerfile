FROM wordpress:4.2.1
ADD mpm_event.conf mpm_prefork.conf mpm_worker.conf /etc/apache2/mods-available/
#
# install vp-cli
#
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
ADD install.sh /install.sh
RUN chmod +x /install.sh
