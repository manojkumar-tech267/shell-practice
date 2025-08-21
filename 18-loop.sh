#!/bin/bash

userid=$(id -u)

 R="\e[31m" 
 G="\e[32m"
 Y="\e[33m"
 N="\e[0m" 

 LOGS_FOLDER="/var/log/shellscript-logs"
 SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
 LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 

 mkdir -p $LOGS_FOLDER 
 echo "Script started executing at $(date)" 

 if [ $userid -ne 0 ]
 then 
    echo "You are not a root user login with root access!!!" 
    exit 1 
 else 
    echo "You are a root user"

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo "$2 executed successfully!!!"
    else 
        echo "$2 not executed successfully"
        exit 1 
    fi 
}

for i in $@ 
do 
    dnf list installed  $i 
    if [ $? -ne 0 ]
    then 
        echo "$i is not there we are going to install"
        dnf install $i -y 
        VALIDATE $? $i 
    else 
        echo "$i already there we are skipping"
    fi 
done 