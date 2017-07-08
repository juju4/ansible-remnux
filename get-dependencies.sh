#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/geerlingguy.java ] && git clone https://github.com/geerlingguy/ansible-role-java.git $rolesdir/geerlingguy.java
#[ ! -d $rolesdir/ernestas-poskus.docker ] && git clone https://github.com/ernestas-poskus/ansible-role-docker.git $rolesdir/ernestas-poskus.docker
#[ ! -d $rolesdir/jgeusebroek.docker ] && git clone https://github.com/jgeusebroek/ansible-role-docker.git $rolesdir/jgeusebroek.docker
[ ! -d $rolesdir/jgeusebroek.docker ] && git clone https://github.com/juju4/ansible-role-docker.git $rolesdir/jgeusebroek.docker
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.remnux ] && ln -s ansible-remnux $rolesdir/juju4.remnux
[ ! -e $rolesdir/juju4.remnux ] && cp -R $rolesdir/ansible-remnux $rolesdir/juju4.remnux

## don't stop build on this script return code
true

