#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "Please!!! run with root access"
    exit 1 
else 
    echo "You are running with root access"
fi 

dnf list installed mysql 
if [ $? -ne 0 ]
then 
    echo "MySql is not installed going to install it"
    dnf install mysql -y 
    if [ $? -eq 0 ]
    then 
        echo "Installing mysql is success"
    else 
        echo "Installing MySql is failed" 
        exit 1
    fi 
else 
    echo "MySql is already installed... Nothing todo"
fi 