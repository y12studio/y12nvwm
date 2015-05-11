FROM alpine:3.1
RUN apk add --update bash curl openssl && rm -rf /var/cache/apk/*
ADD alias.sh docker-compose.yml post.sh host_dc.sh host_swap.sh /dcfiles/
ADD wpred /dcfiles/wpred
ADD nginx /dcfiles/nginx
ADD setup.sh /setup.sh
RUN chmod +x /setup.sh
RUN chmod +x /dcfiles/*.sh
CMD /setup.sh
