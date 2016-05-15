# install bazel
echo "Downloading Bazel 0.2.2"
wget --quiet https://github.com/bazelbuild/bazel/releases/download/0.2.2/bazel-0.2.2-installer-linux-x86_64.sh
sudo chmod +x bazel-0.2.2-installer-linux-x86_64.sh
echo "Installing Bazel"
./bazel-0.2.2-installer-linux-x86_64.sh --user
echo "source /home/vagrant/.bazel/bin/bazel-complete.bash" >> /home/vagrant/.bashrc
export PATH="/home/vagrant/bin:$PATH"
source /home/vagrant/.bazel/bin/bazel-complete.bash

# install syntaxnet
echo "Installing SyntaxNet"
mkdir syntaxnet
cd syntaxnet/
git clone --recursive https://github.com/tensorflow/models.git
cd models/syntaxnet/tensorflow/
echo "Building SyntaxNet, this will take a few minutes"
export PYTHON_BIN_PATH="/usr/bin/python"
export TF_NEED_CUDA=0
./configure
echo "Testing SyntaxNet"
cd ..
bazel test syntaxnet/... util/utf8/...

echo "Done!\n"
