# syntaxnet
Vagrant file for SyntaxNet / Tensorflow

## Installation

Running this Vagrant box has the following dependencies:

* Vagrant
  * Installation instructions [here](https://www.vagrantup.com/docs/installation/)
* VirtualBox
  * Download from [here](https://www.virtualbox.org)
* Git 
  * Installation instructions [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

When all dependencies are met, execute the following in a terminal shell:
```shell
git clone https://github.com/loyning/syntaxnet
cd syntaxnet
vagrant up
```

## Tests

To test your installation:
```shell
cd /home/vagrant/syntaxnet/models/syntaxnet
echo 'Bob brought the pizza to Alice.' | syntaxnet/demo.sh
```

For additional tests, refer to [https://github.com/tensorflow/models/blob/master/syntaxnet/README.md#getting-started](Parsey McParsefaces official documentation).

## Contact
To ask questions or report issues please contact syntaxnet-users@google.com.
