#!/bin/sh
# Get the latest updates at the start
apt-get update
# Make necessary directories
profile="~/.profile"
if [ -f "$profile" ]
then
	echo "$profile found."
else
  touch ~/.profile
  echo "$profile created."
fi
mkdir ~/go
mkdir ~/go/bin
mkdir ~/go/src
mkdir ~/go/pkg
# Install Go - Current version is 1.10.2, needs to be updated if newer version is released
curl -O https://storage.googleapis.com/golang/go1.10.2.linux-amd64.tar.gz
tar -xvf go1.10.2.linux-amd64.tar.gz
mv go /usr/local
# Install Mongo
# Install mySQL (may already be present)
# Install Flutter
# Install nginx
# Install docker
# Export paths
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
echo "export PATH=$PATH:/usr/local/go" >> ~/.profile
echo "export PATH=$PATH:$HOME/go/bin" >> ~/.profile
echo "export GOPATH=$HOME/go" >> ~/.profile
echo "export GOBIN=$GOPATH/bin" >> ~/.profile
# Reload .profile
source ~/.profile
# Ensure it is up to date
apt-get update
