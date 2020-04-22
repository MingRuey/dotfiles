#!/bin/bash

ChangeGitURL(){
    user="raychou"

    if [ -z $1 ]
    then
        echo "Old IP address must not empty"
        exit 1
    fi

    if [ -z $2 ]
    then 
        echo "New IP address must not empty"
        exit 1
    fi

    old=$1
    new=$2

    url=$(git remote get-url origin)

    oldip="$user@$old"
    newip="$user@$new"

    new_url="${url/$oldip/$newip}"

    git remote set-url origin $new_url
    echo "Set git remote origin to $new_url"
}


FindContainer(){
    image="leetcode:ver0"
    running=$(docker ps -a -q --filter ancestor=$image)
    if [[ -z "${running// }" ]]
    then
        echo "Container of $image not found."
    else
        echo "Container of $image found(ID: $running)"
    fi
}
