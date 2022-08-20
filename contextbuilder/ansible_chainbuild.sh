#!/bin/bash

cd .. 

declare -A dockergitrepos
dockergitrepos["dockerimage_ubuntu22.04_base"]="https://github.com/zorani/dockerimage_ubuntu22.04_base.git"
dockergitrepos["dockerimage_ubuntu22.04_add_default_user"]="https://github.com/zorani/dockerimage_ubuntu22.04_add_default_user.git"
dockergitrepos["dockerimage_ubuntu22.04_pythondev"]="https://github.com/zorani/dockerimage_ubuntu22.04_pythondev.git"
dockergitrepos["dockerimage_ubuntu22.04_ansible"]="https://github.com/zorani/dockerimage_ubuntu22.04_ansible.git"

for key in ${!dockergitrepos[@]}; do 
    if [ ! -d ${key} ]
    then 
        git clone ${dockergitrepos[${key}]}
    else
        echo "git hub repo \"${key}\" already checked out"
    fi 
done

#exit 9999
#Lets build the base image
cd dockerimage_ubuntu22.04_base
./rebuildimage.sh 
docker push zokidoki/ubuntu22.04_base:1.0

cd ..

#Lets build a base image with, default user:ubuntu and password:ubuntu
cd dockerimage_ubuntu22.04_add_default_user
./rebuildimage.sh 
docker push zokidoki/ubuntu22.04_base:withdefaultuser

cd ..

#Lets build a base image with multiple versions of python
cd dockerimage_ubuntu22.04_pythondev
./rebuildimage.sh 
docker push zokidoki/ubuntu22.04_base:deadsnakes

#We would like deadsnakes to be it's own repo
#Lets rename the image and push it to dockerhub
docker tag zokidoki/ubuntu22.04_base:deadsnakes  zokidoki/ubuntu22.04_deadsnakes:1.0
docker push zokidoki/ubuntu22.04_deadsnakes:1.0

cd ..
#Lets build an ansible image 
cd dockerimage_ubuntu22.04_ansible
./rebuildimage.sh 
docker push zokidoki/ubuntu22.04_base:ansible

#Lets delete all the repos if you dont need them.

exit 9999
cd ..

for key in ${!dockergitrepos[@]}; do 
    if [ -d ${key} ]
    then
        echo "deleting ${key} ..." 
        rm -rf ${key}
    fi 
done

