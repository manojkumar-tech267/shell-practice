#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "Please run with root access!!!"
    exit 1 
else 
    echo "You are a root user" 
fi  

validate()
{
    if [ $1 -eq 0 ]
    then 
        echo "$2 is installed successfully!!!"
    else 
        echo "$2 not installed successfully!!!"
        exit 1 
    fi 
}

dnf list installed mysql 
if [ $? -ne 0 ]
then 
    echo "Mysql is not installed we are going to install!!!" 
    dnf install mysql -y 
    validate $? "MYSQL"
else 
    echo "MySQL is already installed we are skipping"
fi 

dnf list installed nginx 
if [ $? -ne 0 ]
then 
    echo "Nginx is not installed we are going to install!!!" 
    dnf install nginx -y 
    validate $? "Nginx" 
else 
    echo "Nginx is already installed we are skipping!!!" 
fi 

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "Python3 is not there we are going to install!!!" 
    dnf install python3 
    validate $? "Python3"
else 
    echo "Python3 is already there we are going to skip!!!" 
fi 
