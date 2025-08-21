#!/bin/bash 

userid=$(id -u);

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
    echo -e "$G Root access confirmed. Proceeding with installation checks. $N" | tee -a $LOG_FILE 
fi 

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo -e "$G Success: $2 has been installed successfully. $N" | tee -a $LOG_FILE 
    else 
        echo -e "$R Error: $2 installation failed. Please check your package manager and network connection. $N" | tee -a $LOG_FILE 
        exit 1 
    fi 
}

dnf list installed mysql &>> $LOG_FILE 
if [ $? -ne 0 ]
then 
    echo -e "$Y MySQL is not installed. Starting installation now. $N" | tee -a $LOG_FILE 
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? "MySQL" 
else 
    echo -e "$G MySQL is already installed. No action needed. $N" | tee -a $LOG_FILE 

dnf list installed nginx &>> $LOG_FILE 
if [ $? -ne 0 ]
then 
    echo -e "$Y Nginx is not installed. Starting installation now. $N" | tee -a $LOG_FILE 
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "Nginx" 
else 
    echo -e "$G Nginx is already installed. No action needed. $N" | tee -a $LOG_FILE  
fi 


