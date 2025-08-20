#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "Error: This script must be run as root. Please use sudo or switch to the root user."
    exit 1 
else 
    echo "Root access confirmed. Proceeding with installation checks."
fi  

validate()
{
    if [ $1 -eq 0 ]
    then 
        echo "Success: $2 has been installed successfully."
    else 
        echo "Error: $2 installation failed. Please check your package manager and network connection."
        exit 1 
    fi 
}

dnf list installed mysql 
if [ $? -ne 0 ]
then 
    echo "MySQL is not installed. Starting installation now."
    dnf install mysql -y 
    validate $? "MYSQL"
else 
    echo "MySQL is already installed. No action needed."
fi 

dnf list installed nginx 
if [ $? -ne 0 ]
then 
    echo "Nginx is not installed. Starting installation now."
    dnf install nginx -y 
    validate $? "Nginx" 
else 
    echo "Nginx is already installed. No action needed."
fi 

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "Python3 is not installed. Starting installation now."
    dnf install python3 
    validate $? "Python3"
else 
    echo "Python3 is already installed. No action needed."
fi 
