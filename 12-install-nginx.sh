#!/bin/bash 

userid=$(id -u)

if [ userid -ne 0 ] 
then 
    echo "Please!!! run with root user"
    exit 1 
else 
    echo "You are running with root user access"
fi 
echo $? 