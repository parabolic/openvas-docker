## Dockerized openvas installation

### Description

This dockerfile uses the following ppa ppa:mrazavi/openvas to get openvas.

Some packages are installed beforehand both for openvas and for debbuging.

### Instructions

**clone the repo**
```
git clone git@github.com:parabolic/openvas-docker.git
```
**cd into the repo**
```
cd openvas-docker
```
**build the image**
```
docker build . -t openvas
```
**run the image**
```
docker run -d -it -p 443:443 openvas
```
**access openvas**
```
https://localhost
username: admin
password: admin
```

**all at once for copy paste**
```
git clone git@github.com:parabolic/openvas-docker.git
cd openvas-docker
docker build . -t openvas
docker run -d -it -p 443:443 openvas
```
