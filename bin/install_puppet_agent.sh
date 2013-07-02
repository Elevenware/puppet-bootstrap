#!/bin/sh
DIRNAME=`dirname $0`

function install_puppet {

    scp -i $IDENTITY_FILE "$DIRNAME/bin/puppetlabs.repo" "${USER}@${HOST}:/tmp/puppetlabs.repo"
	ssh -i $IDENTITY_FILE "${USER}@${HOST}" "sudo mv /tmp/puppetlabs.repo /etc/yum.repos.d/"
	ssh -i $IDENTITY_FILE "${USER}@${HOST}" "sudo rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm"
	ssh -i $IDENTITY_FILE "${USER}@${HOST}" "sudo yum -y install puppet"
}

while getopts :u:h:i: OPT
do case "$OPT" in
  h) echo "HOST $OPTARG";HOST="$OPTARG";;
  u) echo "USER $OPTARG";USER="$OPTARG";;
  i) echo "ID FILE $OPTARG";IDENTITY_FILE="$OPTARG";;
  [?]) print >&2 "Usage: $0 [-h host -u username -i identity_file]"
  esac
done

install_puppet