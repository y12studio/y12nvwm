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
wordpress setup
-----
```
# su - xuser
$ cd y12nvwm && source alice.sh && dcsetup
$ dcup
$ dc ps
$ wp2sh /wpinstall.sh
```
