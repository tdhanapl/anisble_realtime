#!/bin/bash

usage()
{

echo "./sshkeypairsetup.sh <pass IP address or hostname or fqdn with space>"

}

copypublickey()
{

echo "Copy the public ssh key for user : $user to remote nodes to manage"
for node in ${nodes[@]}; do
	ssh-copy-id -i $HOME/.ssh/id_rsa $user@$node
done

}

if [ "$#" -ge 1 ]; then
	echo "Arguments passed correctly"
else
	usage; exit 1
fi

echo "Home Directory : $HOME"
user=`echo $HOME | awk -F"/" '{print $NF}'`
echo $user
#nodes=("fedkubemaster" "fedkubenode")
#nodes=("fedser35")
nodes=("$@")


if [[ -f $HOME/.ssh/id_rsa ]] && [[ -f $HOME/.ssh/id_rsa.pub ]]; then
	echo "SSH key pair avaiable for user : $user"
	copypublickey
else
	echo "Generate SSH keypair for user : $user"
	ssh-keygen -t rsa -q -N '' -f $HOME/.ssh/id_rsa
	copypublickey
fi
