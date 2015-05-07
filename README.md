Install on DigitalOcean/DreamCompute
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

wordpress conf
-----
```
# su - xuser
$ cd y12nvwm
$ source alice.sh
$ dcup
$ wp2sh
# /wpinstall.sh
```
