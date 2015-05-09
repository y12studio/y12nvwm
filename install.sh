#!/bin/bash

# Messages
echo "=========================================================="
echo "Welcome to Y12Studio's Ubuntu Swap/Compose install script!"
echo "=========================================================="
echo ""
SCRIPTPATH=$( cd "$(dirname "$0")" ; pwd -P )
# SWAP_SIZE=512M
SWAP_SIZE="1G"
read -e -p "SwapSize(M/G) [${SWAP_SIZE}]: " -i "${SWAP_SIZE}" SWAP_SIZE
#
# setup docker
#
echo 'DOCKER_OPTS="--bip=172.17.42.1/24 --dns 172.17.42.1 --dns 8.8.8.8 --dns 8.8.4.4"' | sudo tee /etc/default/docker -a
#
# install docker-compose
#
sudo apt-get install -yq python-pip git
sudo pip install -U docker-compose
cd ${SCRIPTPATH} && docker-compose pull && docker-compose build
#
# CraftThatBlock/SwapUbuntu
# https://github.com/CraftThatBlock/SwapUbuntu
#
# Setup variables
SWAP_PATH="/swapfile"

# Start script
sudo fallocate -l $SWAP_SIZE $SWAP_PATH
sudo chmod 600 $SWAP_PATH
sudo mkswap $SWAP_PATH
sudo swapon $SWAP_PATH
echo "$SWAP_PATH   none    swap    sw    0   0" | sudo tee /etc/fstab -a
sudo sysctl vm.swappiness=10
echo "vm.swappiness=10" | sudo tee /etc/sysctl.conf -a
sudo sysctl vm.vfs_cache_pressure=50
echo "vm.vfs_cache_pressure=50" | sudo tee /etc/sysctl.conf -a

# Done
echo ""
echo "=========================================================="
echo "$ sudo reboot now"
echo "[VPS Web Console]Create a snapshot."
echo "# su - user"
echo "$ cd y12nvwm && source alias.sh && dcsetup"
echo "$ dcup"
echo "$ wp2sh /wpinstall.sh"
echo "=========================================================="
echo ""
