#!/usr/bin/env bash

# update apt
sudo apt-get -qq -y update
sudo apt-get -qq -y dist-upgrade

# install java jdk
sudo apt-get install -y python-software-properties debconf-utils
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get -qq -y update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get -qq -y install oracle-java8-installer

# install dependencies
sudo apt-get install -qq -y swig python-pip git build-essential python-numpy python-dev zlib1g-dev unzip

# install Python dependencies
sudo pip install -U protobuf==3.0.0b2 asciitree
