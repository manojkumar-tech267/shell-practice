#!/bin/bash 

userid=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $userid -ne 0 ]
then 
    echo -e "$R Error: This script must be run as root. Please use sudo or switch to the root user. $N"
    exit 1 
else 
    echo -e "$G Root access confirmed. Proceeding with installation checks. $N"
fi 

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo -e "$G Success: $2 has been installed successfully. $N"
    else 
        echo -e "$R Error: $2 installation failed. Please check your package manager and network connection. $N"
        exit 1 
    fi 
}

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo -e "$Y MySQL is not installed. Starting installation now. $N"
    dnf install mysql -y 
    VALIDATE $? "MySQL" 
else 
    echo -e "$G MySQL is already installed. No action needed. $N"
fi 

dnf list installed nginx 
if [ $? -ne 0 ]
then 
    echo -e "$Y Nginx is not installed. Starting installation now. $N"
    dnf install nginx -y 
    VALIDATE $? "Nginx" 
else 
    echo -e "$G Nginx is already installed. No action needed. $N" 
fi 