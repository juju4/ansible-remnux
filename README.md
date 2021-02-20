[![Actions Status - Master](https://github.com/juju4/ansible-remnux/workflows/AnsibleCI/badge.svg)](https://github.com/juju4/ansible-remnux/actions?query=branch%3Amaster)
[![Actions Status - Devel](https://github.com/juju4/ansible-remnux/workflows/AnsibleCI/badge.svg?branch=devel)](https://github.com/juju4/ansible-remnux/actions?query=branch%3Adevel)

# Remnux ansible role

Ansible role to setup Remnux on a box.

It's basically a conversion of the shell scripts
http://remnux.org/get-remnux.sh

Remnux moved from above shell script to saltstack either directly, either through remnux-cli.
remnux-cli installation is included in the role but not used by default as ideally, ansible role is synchronized with saltstack setup. Until fully done, you can use remnux-cli as needed.


## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.5
 * 2.10

### Operating systems

* Ubuntu 14.04
* Ubuntu 16.04
* Ubuntu 18.04
* Ubuntu 20.04

## Example Playbook

Just include this role in your list.
For example

```
- host: dfir
  roles:
    - juju4.remnux
```

## Variables

Nothing specific for now.

## Known issues

* A few times, got packages install failing and at next run working fine...
ex:
```
$ vagrant up remnux
[fail]
$ vagrant provision remnux
[OK]
```

* menu entries are not available for remnux(lxde)
just added two as example.


## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/juju4.remnux
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.remnux/test/vagrant
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
$ packer build -only=virtualbox-iso packer-*.json
## if you want to enable extra log
$ PACKER_LOG_PATH="packerlog.txt" PACKER_LOG=1 packer build packer-*.json
## for digitalocean build, you need to export TOKEN in environment.
##  update json config on your setup and region.
$ export DO_TOKEN=xxx
$ packer build -only=digitalocean packer-*.json
```

## License

BSD 2-clause

