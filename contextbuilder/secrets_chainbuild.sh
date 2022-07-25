#!/bin/bash

cd .. 

declare -A dockergitrepos
dockergitrepos["dockerimage_ubuntu22.04_add_secrets"]="https://github.com/zorani/dockerimage_ubuntu22.04_base.git"

for key in ${!dockergitrepos[@]}; do 
    if [ ! -d ${key} ]
    then 
        git clone ${dockergitrepos[${key}]}
        echo "Please modify secrets context and rerun"
        exit 9999
    else
        echo "git hub repo \"${key}\" already checked out"
    fi 
done

#exit 9999
#Lets build the local secret image
cd dockerimage_ubuntu22.04_add_secrets
./rebuildimage.sh 
#No push to docker hub will take place.
#You don't want your secrets to be public.


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

