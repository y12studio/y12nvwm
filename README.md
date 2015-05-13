Install on DigitalOcean/Ubuntu 14.04 x64
-----------
```
# adduser xuser
# adduser xuser sudo
# su - xuser
$ wget -qO- https://get.docker.com/ | sh
$ sudo usermod -aG docker xuser
$ exit
# su - xuser
$
$ docker run -v $(pwd)/nvwm:/nvwm y12docker/nvwm:4.2.2
$ cd nvwm && . ./post.sh
$ absh/setup_swap.sh && absh/setup_dc.sh
$ sudo reboot now
```
wordpress setup
-----
```
# su - xuser
$ cd nvwm && source alias.sh
$ dcup
$ dc ps
$ wp2sh /wpinstall.sh
```

build y12docker/nvwm
--------------
```
$ docker build -t y12docker/nvwm:4.2.2 .
$ docker push y12docker/nvwm:4.2.2
```
