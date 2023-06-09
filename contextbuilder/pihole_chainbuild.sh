#!/bin/bash

cd .. 

declare -A dockergitrepos
dockergitrepos["dockerimage_zokihole_pihole"]="git@github.com:zorani/dockerimage_zokihole_pihole.git"

for key in ${!dockergitrepos[@]}; do 
    if [ ! -d ${key} ]
    then 
        git clone ${dockergitrepos[${key}]}
    else
        echo "git hub repo \"${key}\" already checked out"
    fi 
done

#exit 9999
#Lets build the zokihole image
cd dockerimage_zokihole_pihole
./rebuildimage.sh 
docker push zokidoki/zokihole_pihole:1.0

cd ..


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

