#!/bin/bash 
userId=$(id -u)

if [ userId -ne 0 ]
then 
    echo "Error:: Please run this script with root access"
    exit 1
else 
    echo "You are running with root access"
fi 
