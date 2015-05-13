FROM y12docker/ab:1505
ADD alias.sh docker-compose.yml post.sh setup.sh /dcfiles/
ADD wpred /dcfiles/wpred
ADD nginx /dcfiles/nginx
RUN chmod +x /dcfiles/*.sh && \
    mkdir /dcfiles/absh && cp -r /sh/u1404/*.sh /dcfiles/absh/
CMD /dcfiles/setup.sh
