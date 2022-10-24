# oxidized_provision
building a oxidized machine with infra as a code (ansible/vagrant)

Oxidized is an open source software written in Ruby to do backups for network devices configurations.
If you wish to learn more about this solution, you can read more on the git bellow

https://github.com/ytti/oxidized



Here I put two ways to do the provision of the oxidized. One with Vagrant and another with Ansible.

#VAGRANT:

With vagrant is simple. Just run "vagrant up" on the directory where is the vagrant file, this will be able to provise all oxidized dependencies and you will only need to run oxidized.
There will be a directory named config on this repository. There you will find two config files related to oxidized (config and router.db). I automated the copy of those files to the server that oxidized will to be easier to test, but you may change those files as you wish.

#ANSIBLE:

With Ansible will be a little more complex. Since Ansible need a private key ssh to connect to the server and a user with sudo privilegies (on the server that will be provisioned) First you will need to make the server user a sudoer and this user need to have the ability to run sudo commands without password. Then you have to generate a private and public ssh key to connect to the server.

As soon as these requirements are meet, create/change the enviroments variables ANSIBLE_USER and ANSIBLE_HOST and run the full_provision.sh. This script automate the ssh private key before provisioning the server and them it will provision the server to run oxidized

PS: Edit the full_provision.sh before run it replacing *PATH_TO_THE_PUBLICK_KEY* to the path of your public ssh key
