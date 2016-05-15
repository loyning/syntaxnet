cd /home/vagrant

# install bazel
if [ ! -f bazel-0.2.2-installer-linux-x86_64.sh ]; then
    echo "Downloading Bazel 0.2.2"
    wget --quiet https://github.com/bazelbuild/bazel/releases/download/0.2.2/bazel-0.2.2-installer-linux-x86_64.sh
    sudo chmod +x bazel-0.2.2-installer-linux-x86_64.sh
    echo "Installing Bazel"
    ./bazel-0.2.2-installer-linux-x86_64.sh --user
fi

if [[ ! ":$PATH:" == *"bazel-complete.bash"* ]]; then
    echo "source /home/vagrant/.bazel/bin/bazel-complete.bash" >> /home/vagrant/.bashrc
    export PATH="/home/vagrant/bin:$PATH"
    source /home/vagrant/.bazel/bin/bazel-complete.bash
fi

# install syntaxnet
echo "Installing SyntaxNet"
if [ ! -d syntaxnet ]; then
    mkdir syntaxnet
    cd syntaxnet/
    git clone --recursive https://github.com/tensorflow/models.git
    cd models/syntaxnet/tensorflow/
    echo "Building SyntaxNet"
    export PYTHON_BIN_PATH=`which python`
    export TF_NEED_CUDA=0
    ./configure
    echo "Testing SyntaxNet, this will take a few minutes"
    cd ..
    bazel test syntaxnet/... util/utf8/...
fi

echo "Done!\n"
