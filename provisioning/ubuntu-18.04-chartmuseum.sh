#!/bin/bash

# Ubuntu provisioning file
# sudo apt update

# install chartmuseum
IMAGETAG="0.9.0"
echo "install chartmuseum version $IMAGETAG"
sudo docker run --rm -d \
     -p 8080:8080 \
     -v /home/vagrant/charts:/charts \
     -e DEBUG=true \
     -e STORAGE=local \
     -e STORAGE_LOCAL_ROOTDIR=/charts \
     chartmuseum/chartmuseum:v$IMAGETAG

# create date string
DATE=`date +%Y%m%d%H%M`

# store k3s version
CHARTMUSEUM_VERSION=$IMAGETAG
echo "$CHARTMUSEUM_VERSION.$DATE" > /vagrant/version
