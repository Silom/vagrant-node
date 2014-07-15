# Vagrant-node

## Requirements

* Vagrant
* Virtualbox

## Informations

Easy Nodejs and MongoDB Vagrant box for your next web application.

The provisioning is a Ansible process on the local/guest side, so you dont have to worry about installing Ansible.

*Dont interrupt the setup*, Ansible will provide you errors.

#### Installed software

* MongoDB
* Node.js
* npm
* grunt-cli
* bower
  * git

#### Network

This box is configured to run in a private network.
If you want to access your Node.js web application, connect to the IP with your application port (e.g. 192.168.101.101:3000).

Vagrant Network IP: 192.168.101.101

And like the last version of the box, you can change and customize everything in the ``Vagrantfile`` or the setup folder.

#### Shared folders

Your projects is shared in:
``/var/nodespace/project/``

All resources e.g. database dump:
``/var/nodespace/resources/``

### Advanced

#### Nginx

If you want your project to run in a more server like environment, go to the vagrant.yml and take you the comment for ``nginx``.
Ansible will set up Nginx with the default template in the ``setup/roles/nginx/templates/default``.
Do yourself a favour and change both the template and all variables in ``setup/group_vars/all`` for the right setup.

# Licences

MIT
vagrant-node
