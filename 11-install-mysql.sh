#!/bin/bash 

userid=$(id -u)
if [ $userid -ne 0 ]
then 
    echo "You are not a root user please run with root access" 
    exit 1
else 
    echo "You are running with root user access"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "Mysql is not installed we are going to install!!!"
    dnf install mysql -y 
    if [ $? -eq 0 ]
    then 
        echo "Mysql installed successfully"
    else 
        echo "Mysql installation failed" 
        exit 1 
    fi 
else 
    echo "Mysql is already there we are nothing to do!!!"
fi 

