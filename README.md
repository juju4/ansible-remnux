[![Build Status](https://travis-ci.org/juju4/ansible-remnux.svg?branch=master)](https://travis-ci.org/juju4/ansible-remnux)(Fails because of maximum execution time)
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

## License

BSD 2-clause

