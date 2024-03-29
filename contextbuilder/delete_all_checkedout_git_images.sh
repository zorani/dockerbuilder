#!/bin/bash

cd .. 

declare -A dockergitrepos
dockergitrepos["dockerimage_ubuntu22.04_base"]="git@zi.github.com:zorani/dockerimage_ubuntu22.04_base.git"
dockergitrepos["dockerimage_ubuntu22.04_add_default_user"]="git@zi.github.com:zorani/dockerimage_ubuntu22.04_add_default_user.git"
dockergitrepos["dockerimage_ubuntu22.04_pythondev"]="git@zi.github.com:zorani/dockerimage_ubuntu22.04_pythondev.git"
dockergitrepos["dockerimage_ubuntu22.04_python"]="git@zi.github.com:zorani/dockerimage_ubuntu22.04_python.git"
dockergitrepos["dockerimage_ubuntu22.04_add_secrets"]="git@zi.github.com:zorani/dockerimage_ubuntu22.04_add_secrets.git"
dockergitrepos["dockerimage_ubuntu22.04_ansible"]="git@zi.github.com:zorani/dockerimage_ubuntu22.04_ansible.git"
dockergitrepos["dockerimage_ubuntu22.04_secrets_ansible"]="git@zi.github.com:zorani/dockerimage_ubuntu22.04_secrets_ansible.git"
dockergitrepos["dockerimage_zokihole_pihole"]="git@github.com:zorani/dockerimage_zokihole_pihole.git"
dockergitrepos["dockerimage_ubuntu22.04_secrets_default_python"]="git@zi.github.com:zorani/dockerimage_ubuntu22.04_secrets_default_python.git"

#for key in ${!dockergitrepos[@]}; do 
#    echo ${key}
#    if [ ! -d ${key} ]
#    then 
#        git clone ${dockergitrepos[${key}]}
#    else
#        echo "git hub repo \"${key}\" already checked out"
#    fi 
#done

#Lets delete all the repos if you dont need them.
#Comment/Uncomment next line if you want to delete/not-delete
#exit 9999

for key in ${!dockergitrepos[@]}; do 
    if [ ${key} ]
    then
        echo "deleting ${key} ..." 
        rm -rf ${key}
    fi 
done

