[![Build Status](https://travis-ci.org/juju4/ansible-remnux.svg?branch=master)](https://travis-ci.org/juju4/ansible-remnux)
# Remnux ansible role

Ansible role to setup Remnux on a box.

It's basically a conversion of the shell scripts
http://remnux.org/get-remnux.sh

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0

### Operating systems

Tested with vagrant only on Ubuntu 14.04 for now but should work on 12.04 and similar debian based systems (at the exception of some ppa dependencies)

## Example Playbook

Just include this role in your list.
For example

```
- host: dfir
  roles:
    - remnux
```

## Variables

Nothing specific for now.

## Known issues

* A few times, got packages install failing and at next run working fine...
ex:
$ vagrant up remnux
[fail]
$ vagrant provision remnux
[OK]
* menu entries are not available for remnux(lxde)

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/remnux
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/remnux/test/vagrant
$ vagrant up
$ vagrant ssh
```

Role has also a packer config which allows to create image for virtualbox, vmware, eventually digitalocean, lxc and others.
When building it, it's advise to do it outside of roles directory as all the directory is upload to the box during building 
and it's currently not possible to exclude packer directory from it (https://github.com/mitchellh/packer/issues/1811)
```
$ cd /path/to/packer-build
$ cp -Rd /path/to/remnux/packer .
## update packer-*.json with your current absolute ansible role path for the main role
## you can add additional role dependencies inside setup-roles.sh
$ cd packer
$ packer build packer-*.json
$ packer build -only=virtualbox packer-*.json
## if you want to enable extra log
$ PACKER_LOG=1 packer build packer-*.json
## for digitalocean build, you need to export TOKEN in environment.
##  update json config on your setup and region.
$ export DO_TOKEN=xxx
$ packer build -only=digitalocean packer-*.json
```

## License

BSD 2-clause

