#!/bin/sh

# Get the latest updates at the start
sudo apt-get update
sudo apt upgrade -y
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
mkdir /data
mkdir /data/db

# -------------------------------------------------
# Install Python3 and pip (may already be installed)
# -------------------------------------------------
echo -e "\n--- Installing Python 3 + pip3 --"
sudo apt-get install python3 python3-pip

# -------------------------------------------------
# Install Go - Current version is 1.10.2, needs to be updated if newer version is released
# -------------------------------------------------
echo -e "\n---- Install Go ----"
sudo curl -O https://storage.googleapis.com/golang/go1.10.2.linux-amd64.tar.gz
sudo tar -xvf go1.10.2.linux-amd64.tar.gz
sudo mv go /usr/local

# -------------------------------------------------
# Install MongoDB - Specific to Ubuntu 18.04 but may work on other debian flavors
# -------------------------------------------------
echo -e "\n---- Install MongoDB ----"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
sudo apt install -y mongodb-org

# -------------------------------------------------
# Install mySQL (may already be present)
# -------------------------------------------------
echo -e "\n---- Install MySQL ----"
sudo apt-get install mysql-server

#--------------------------------------------------
# Install PostgreSQL Server
#--------------------------------------------------
echo -e "\n---- Install PostgreSQL Server ----"
sudo apt-get install postgresql -y

# -------------------------------------------------
# Install Flutter and Dartlang -- adding later
# -------------------------------------------------
# echo -e "\n---- Install Flutter and Dart ----"

# -------------------------------------------------
# Install nginx web server
# -------------------------------------------------
echo -e "\n---- Install NGINX ----"
sudo apt install nginx

# -------------------------------------------------
# Install docker
# -------------------------------------------------
echo -e "\n---- Install Docker ----"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce

# -------------------------------------------------
# Install Node
# -------------------------------------------------
echo -e "\n---- Install Node ----"
sudo apt-get install nodejs

# -------------------------------------------------
# Install NPM Package Manager
# -------------------------------------------------
echo -e "\n---- Install NPM ----"
sudo apt-get install npm

# -------------------------------------------------
# Export paths
# -------------------------------------------------
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
echo "export PATH=$PATH:/usr/local/go" >> ~/.profile
echo "export PATH=$PATH:$HOME/go/bin" >> ~/.profile
echo "export GOPATH=$HOME/go" >> ~/.profile
echo "export GOBIN=$GOPATH/bin" >> ~/.profile

# -------------------------------------------------
# Reload .profile
# -------------------------------------------------
source ~/.profile

# -------------------------------------------------
# Ensure it is up to date
# -------------------------------------------------
sudo apt-get update
sudo apt-get upgrade -y
