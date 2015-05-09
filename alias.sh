DCP=nvwm
alias dc='docker-compose -p ${DCP}'
alias wp2sh='docker exec -i -t ${DCP}_wordpress_1'
alias varnish2sh='docker exec -i -t ${DCP}_varnish_1'
alias nginx2sh='docker exec -i -t ${DCP}_nginx_1'
alias dcup='dc stop && dc rm && dc build && dc up -d'
alias dcsetup='chmod +x ./dcyml.sh && ./dcyml.sh'
