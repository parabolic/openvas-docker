# Pull base image.
FROM ubuntu:16.04

ARG DEBIAN_FRONTEND=noninteractive

# Install needed software
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get -y install \
  build-essential \
  sqlite3 \
  wget \
  curl \
  rsync \
  less \
  htop \
  nmap \
  python-setuptools \
  python-software-properties \
  software-properties-common

# Add the ppa and install openvas
RUN add-apt-repository ppa:mrazavi/openvas -y
RUN apt-get update
RUN apt-get -y install openvas
RUN openvas-nvt-sync
RUN openvas-scapdata-sync
RUN openvas-certdata-sync
CMD [ "sh", "-c", "/etc/init.d/openvas-scanner start && /etc/init.d/openvas-manager start && /etc/init.d/redis-server start && /etc/init.d/openvas-gsa start && openvasmd --rebuild --progress" ]
EXPOSE 443
