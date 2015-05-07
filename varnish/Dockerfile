FROM jacksoncage/varnish

ADD default.vcl /etc/varnish/default.vcl
ADD start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
