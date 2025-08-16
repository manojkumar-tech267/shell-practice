#!/bin/bash 

userid=$(id -u);

R="\e[31m"
G="\e[32m"
Y="\e[33m" 
N="\e[0m" 

if [ $userid -ne 0 ]
then 
    echo -e "$Y Please!!!$N run with root access" 
    exit 1 
else 
    echo -e "$G You Are running with root access $N"
fi 

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo -e "$G $2 installed Properly $N"
    else 
        echo -e "$R $2 Not installed properly $N"
        exit 1
    fi 
}

dnf list installed mysql 
if [ $? -ne 0 ]
then 
    echo -e "$Y MySql is installing!!!! $N"
    dnf install mysql -y
    VALIDATE() $? "MySql" 
else 
    echo -e "$G MySql is already there no need to do anything!!! $N"
fi 

dnf list installed nginx 
if [ $? -ne 0 ]
then 
    echo -e "$Y Nginx is not there in your system we are going to install $N"
    dnf install nginx -y 
    VALIDATE() $? "Nginx" 
else 
    echo -e "$G Nginx is already there in your system we are not going to do anything"
fi 

dnf list installed python3 
if [ $? -ne 0 ]
then 
    echo -e "$Y Python3 is not there in your system we are going to install $N" 
    dnf install python3 -y 
    VALIDATE() $? "Python3" 
else 
    echo -e "$G Python3 is already there in your system we are nothing to do $N"
fi 

