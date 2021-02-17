#!/bin/bash

application_file_path="/vagrant/installed-application.md"

# install chartmuseum
IMAGETAG="0.12.0"
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

# set version
DOCKER_VERSION=$(sudo docker version --format '{{.Server.Version}}')
CHARTMUSEUM_VERSION=$IMAGETAG
echo "# Installed application "  > $application_file_path
echo "***                     " >> $application_file_path
echo "> Docker:      $DOCKER_VERSION" >> $application_file_path
echo "> Chartmuseum: $CHARTMUSEUM_VERSION" >> $application_file_path


