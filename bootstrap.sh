#!/usr/bin/env bash

# update apt
sudo apt-get update
sudo apt-get dist-upgrade

# install java
sudo apt-get install oracle-java8-installer -y

# install dependencies
apt-get install swig python-pip git build-essential python-numpy python-dev zlib1g-dev

# python deps
sudo pip install -U protobuf==3.0.0b2 asciitree

# install elasticsearch
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.7.2.deb
sudo dpkg -i elasticsearch-1.7.2.deb
sudo service elasticsearch start

# install bazel
wget https://github.com/bazelbuild/bazel/releases/download/0.2.2/bazel-0.2.2-installer-linux-x86_64.sh
chmod +x bazel-0.2.2-installer-linux-x86_64.sh
./bazel-0.2.2-installer-linux-x86_64.sh --user
echo "source /home/vagrant/.bazel/bin/bazel-complete.bash" >> ~/.bashrc
source /home/vagrant/.bazel/bin/bazel-complete.bash

# install syntaxnet
mkdir syntaxnet
cd syntaxnet/
git clone --recursive https://github.com/tensorflow/models.git
cd models/syntaxnet/tensorflow/
./configure
cd ..
bazel test syntaxnet/... util/utf8/...

echo "DONE!"




