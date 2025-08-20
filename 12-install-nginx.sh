#!/bin/bash 

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "Error: This script must be run as root. Please use sudo or switch to the root user."
    exit 1 
else 
    echo "Root access confirmed. Checking Nginx installation status..."
fi 

dnf list installed nginx 

if [ $? -ne 0 ]
then 
    echo "Nginx is not installed. Starting installation now."
    dnf install nginx -y 
    if [ $? -eq 0 ]
    then 
        echo "Success: Nginx has been installed successfully."
    else 
        echo "Error: Nginx installation failed. Please check your package manager and network connection."
        exit 1 
    fi 
else 
    echo "Nginx is already installed. No action needed."
fi 