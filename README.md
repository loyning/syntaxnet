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
vagrant up --provision
```

Next time you need to start this VM, simple execute
```shell
vagrant up
```

## Tests

To test your installation:
```shell
vagrant ssh
cd /home/vagrant/syntaxnet/models/syntaxnet
echo 'Bob brought the pizza to Alice.' | syntaxnet/demo.sh
```

For additional tests, refer to [https://github.com/tensorflow/models/blob/master/syntaxnet/README.md#getting-started](Parsey McParsefaces official documentation).

## Reading material
* [SyntaxNet in context: Understanding Google's new TensorFlow NLP model](https://spacy.io/blog/syntaxnet-in-context)
* [TensorFlow: smarter machine learning, for everyone](https://googleblog.blogspot.no/2015/11/tensorflow-smarter-machine-learning-for.html)
* [TensorFlow: Open source machine learning](https://www.youtube.com/watch?v=oZikw5k_2FM) (YouTube video)

## Similar software
* [spaCy](https://spacy.io)
* [Stanford CoreNLP](http://stanfordnlp.github.io/CoreNLP/)


## Contact
To ask questions or report issues please contact syntaxnet-users@google.com.
