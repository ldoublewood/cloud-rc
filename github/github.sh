#!/bin/bash
if [ $# -lt 1 ]; then
    echo "$0 [name]"
    exit 1
fi
name=$1
cd ~/.ssh
mkdir $name
cd $name
echo "generating ssh key, please enter password to protect your private key"
ssh-keygen -f $name
cat $name.pub
echo "please copy above public key into ssh-key setting of your github account"
echo "please input protect password for private key below:"
eval `ssh-agent -s -t 999999m` && ssh-add ~/.ssh/$name/$name
