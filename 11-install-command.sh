#!/bin/bash 

userid=$(id -u)

if [ userid -ne 0 ]
then 
    echo "Please!!! run with root access"
    exit 1 
else 
    echo "You are running with root access"
fi 

echo $? 