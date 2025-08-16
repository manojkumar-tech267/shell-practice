#!/bin/bash 

userid=$(id -u) 

if [ $userid -ne 0 ] 
then 
    echo "Please run with root access!!!" 
    exit 1 
else 
    echo "You are running with root access" 
fi   

dnf list installed mysql 

if [ $? -ne 0 ]
then 
    echo "Mysql is not installed we are going to install !!!"
    dnf install mysql -y 
    if [ $? -eq 0 ]
    then 
        echo "Mysql is installed successfully"
    else 
        echo "Mysql installation failed"
        exit 1
    fi 
else 
    echo "MySql is already installed nothing to do"
fi 