#!/bin/sh

function install_puppet {
	ssh -i $IDENTITY_FILE "${USER}@${HOST}" "sudo yum install puppet"
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