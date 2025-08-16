#!/bin/bash 

userid=$(id -u)

if [ $userid -ne 0 ]
then 
    echo "Please run with root access"
    exit 1 
else 
    echo "you are running with root access"
fi 

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo "$2 installed Successfully!!!" 
    else 
        echo "$2 is not installed Successfully!!!"
        exit 1
    fi 
}


dnf list installed mysql 
if [ $? -ne 0 ]
then 
    echo "MYsql is not installed we are going to install!!!"
    dnf install mysql -y 
    VALIDATE $? "MySql" 
else 
    echo "MySql is already installed we are nothing to do!!!"
fi 

dnf list installed nginx 
if [ $? -ne 0 ] 
then 
    echo "Nginx is not installed we are going to install!!!" 
    dnf install nginx -y 
    VALIDATE $? "Nginx" 
else 
    echo "Nginx is already installed we are nothing to do!!!" 
fi 

dnf list installed python3 
if [ $? -ne 0 ]
then 
    echo "Python3 is not installed we are going to install!!!" 
    dnf install python3 -y 
    VALIDATE $? "Python3" 
else 
    echo "Python3 is already installed we are nothing to do!!!"
fi 



