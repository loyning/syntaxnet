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
sudo apt-get install -qq -y swig git build-essential python-pip python-numpy python-dev zlib1g-dev unzip

# install Python dependencies
sudo pip install -U protobuf==3.0.0b2 asciitree

# install tensorflow (without GPU)
sudo apt-get install python-scipy
sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.7.1-cp27-none-linux_x86_64.whl
sudo pip install quandl pandas sklearn