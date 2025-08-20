#!/bin/bash 

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]
then 
    echo -e "$R You are not a root user run with root access $N"
    exit 1 
else 
    echo -e "$G you are a root user $N"
fi 

VALIDATE()
{
    if [$1 -eq 0 ]
    then 
        echo -e "$G $2 installed successfully $N"
    else 
        echo -e "$R $2 not installed successfully $N" 
        exit 1 
    fi 
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo -e "$R Mysql is not there in our system we are going to install $N"
    dnf install mysql -y 
    VALIDATE $? "MySQL" 
else 
    echo -e "$Y MySQL is already there we are going to skip!!! $N"
fi 

dnf list installed nginx 
if [ $? -ne 0 ]
then 
    echo -e "$R Nginx is not there in our system we are going to install!!! $N"
    dnf install nginx -y 
    VALIDATE $? "Nginx" 
else 
    echo -e "$Y Nginx is already there we are going to skip!!! $N" 
fi 