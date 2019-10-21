#!/bin/bash

# Ubuntu provisioning file
sudo apt update

# install chartmuseum
IMAGETAG="0.9.0"
LOCALDIR="/home/vagrant/charts"
echo "install chartmuseum version $IMAGETAG"
sudo docker run -d --restart=unless-stopped --name chartmuseum -p 8080:8080 \
     -v $LOCALDIR:/charts \
     -e DEBUG=true \
     -e STORAGE=local \
     -e STORAGE_LOCAL_ROOTDIR=/charts \
     chartmuseum/chartmuseum:v$IMAGETAG

# change owner & group
sudo chown -R vagrant $LOCALDIR
sudo chgrp -R vagrant $LOCALDIR

# create date string
DATE=`date +%Y%m%d%H%M`

# store k3s version
CHARTMUSEUM_VERSION=$IMAGETAG
echo "chartmuseum-$CHARTMUSEUM_VERSION" > /vagrant/version
