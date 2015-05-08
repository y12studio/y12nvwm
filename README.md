Install on DigitalOcean/Ubuntu 14.04 x64
-----------
```
# adduser xuser
# adduser xuser sudo
# su - xuser
$ wget -qO- https://get.docker.com/ | sh
$ sudo usermod -aG docker xuser
$ git clone https://github.com/y12studio/y12nvwm.git
$ cd y12nvwm && chmod +x install.sh && ./install.sh
$ sudo reboot now
```
wordpress conf(hostname : blog.y12.tw)
-----
```
# su - xuser
$ cd y12nvwm
$ sed -i "s|192.168.2.73|blog.y12.tw|g" docker-compose.yml
$ source alice.sh
$ dcup
$ dc ps
$ wp2sh /wpinstall.sh
```
