#!/bin/bash

### Gross script to create template ansible playbook with roles directory structure

ansible_home="/home/admin/middleware/stack/github_space/learnansible"
stack=$1
rolename=$2

usage()
{
    echo "#############################################################"
    echo "$ ./roleskeleton.sh <stack> <rolename>"
    echo "$ ./roleskeleton.sh grafana linux_install_grafana_server"
    echo "#############################################################"
    exit 100     
}

prepareskeleton()
{

    mkdir -p $ansible_home/$stack/roles
    touch $ansible_home/$stack/$rolename.yml
    for eachdir in tasks handlers templates files vars defaults meta library
    do
        mkdir -p $ansible_home/$stack/roles/$rolename/$eachdir
        echo "$ansible_home/$rolename/$eachdir created"
        if [[ $eachdir == 'tasks' ]] || [[ $eachdir == 'handlers' ]] || [[ $eachdir == 'vars' ]] || [[ $eachdir == 'defaults' ]] || [[ $eachdir == 'meta' ]]
        then
            touch $ansible_home/$stack/roles/$rolename/$eachdir/main.yml
        fi

    done

}

if [[ $# -ne 2 ]];
then
    usage
else
    echo "Preparing the skeleton structure"
    prepareskeleton
fi