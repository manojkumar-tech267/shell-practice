#!/bin/bash 

userid=$(id -u)

if [ $userid -ne 0 ] 
then 
    echo "Please!!! run with root user"
    exit 1 
else 
    echo "You are running with root user access"
fi 

dnf list installed nginx

if [ $? -ne 0 ] 
then 
    echo "Nginx is not installed we are installing!!!"
    dnf install nginx -y 
    if [ $? -eq 0 ]
    then 
        echo "Nginx is installed successfully" 
    else 
        echo "Nginx is not installed successfully"
        exit 1
    fi 
else 
    echo "Nginx is already installed we are nothing to do!!!"
fi 

