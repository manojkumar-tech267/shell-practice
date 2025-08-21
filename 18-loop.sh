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
 echo -e "$Y Script started executing at $(date) $N" | tee -a $LOG_FILE

 if [ $userid -ne 0 ]
 then 
    echo -e "$R Error: This script must be run as root. Please use sudo or switch to the root user. $N" | tee -a $LOG_FILE
    exit 1 
 else 
    echo -e "$G Root access confirmed. Proceeding with package checks. $N" | tee -a $LOG_FILE
fi 

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo -e "$G Installing: $2  Success $N" | tee -a $LOG_FILE
    else 
        echo -e "$R Installing $2 Failure. $N" | tee -a $LOG_FILE
        exit 1 
    fi 
}

for i in $@ 
do 
    dnf list installed $i &>> $LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo -e "$Y $i is not installed. Installing now. $N" | tee -a $LOG_FILE
        dnf install $i -y &>> $LOG_FILE
        VALIDATE $? $i
    else 
        echo -e "$G $i is already installed. No action needed. $N" | tee -a $LOG_FILE
    fi
done