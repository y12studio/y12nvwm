#!/bin/bash

for name in $(compgen -v Y_); do
    eval value=\$$name
    sed -i "s|${name}|${value}|g" /etc/varnish/default.vcl
done

# Start varnish and log
varnishd -f /etc/varnish/default.vcl -s malloc,100M -a 0.0.0.0:${VARNISH_PORT}
varnishlog
