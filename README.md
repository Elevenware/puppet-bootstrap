# Elevenware Puppet bootstrap scripts

These scripts can be used to provision a barebones server with Puppet agent and/or a Puppet master

Currently aimed at RHEL/CentOS/Fedora. Testing is on CentOS 6.4.

To run the tests, you will need [Vagrant](http://vagrantup.com) and [Ruby](http://ruby-lang.org) installed. 

In addition, you need a barebones Vagrant box that *doesn't* already have Puppet installed. We provide one [here](https://www.dropbox.com/s/wr75apg2yeojvc6/centos-6.4-naked.box) but the Vagrantfile will grab this automatically.  

```
$ bundle install
$ rake cucumber_dev # leaves Vagrant instances running
$ rake cucumber # tears down Vagrant instances after the tests run
```
