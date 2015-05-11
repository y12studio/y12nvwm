#!/bin/bash
sudo chown -R "$USER" $(pwd)
DC_EXTHOST=localhost
read -e -p "Hostname/Ip Address [${DC_EXTHOST}]: " -i "${DC_EXTHOST}" DC_EXTHOST
for name in $(compgen -v DC_); do
    eval value=\$$name
    sed -i "s|${name}|${value}|g" docker-compose.yml
done
source alias.sh
echo ""
echo "   ./host_swap.sh && ./host_dc.sh && sudo reboot now"
echo ""
echo "   dcup"
echo "   wp2sh /wpinstall.sh"
echo ""
