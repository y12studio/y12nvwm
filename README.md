Install on DigitalOcean/DreamCompute
-----------
```
# adduser xuser
# adduser xuser sudo
# su - xuser
$ wget -qO- https://get.docker.com/ | sh
$ sudo usermod -aG docker xuser
$ wget -qO- https://raw.githubusercontent.com/y12studio/y12nvwm/master/install.sh | sh
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
