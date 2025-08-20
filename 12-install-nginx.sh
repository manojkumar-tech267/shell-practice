#!/bin/bash 

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "Please!!! run with root access you are not a root user"
    exit 1 
else 
    echo "You are a root user!!"
fi 

dnf list installed nginx 

if [ $? -ne 0 ]
then 
    echo "Nginx is not installed we are going to install!!!"
    dnf install nginx -y 
    if [ $? -eq 0 ]
    then 
        echo "Nginx installed successfully"
    else 
        echo "Nginx is not installed successfully!!!"
        exit 1 
    fi 
else 
    echo "Nginx is already installed we are skipping!!!!"
fi 