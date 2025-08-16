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
echo "Script started executing at:  $(date)" &>> $LOG_FILE 

if [ $userid -ne 0 ]
then 
    echo -e "$Y Please!!!$N run with root access" &>> $LOG_FILE 
    exit 1 
else 
    echo -e "$G You Are running with root access $N" &>> $LOG_FILE 
fi 

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo -e "$G $2 installed Properly $N" &>> $LOG_FILE 
    else 
        echo -e "$R $2 Not installed properly $N" &>> $LOG_FILE 
        exit 1
    fi 
}

dnf list installed mysql 
if [ $? -ne 0 ]
then 
    echo -e "$Y MySql is installing!!!! $N" &>> $LOG_FILE 
    dnf install mysql -y &>> $LOG_FILE 
    VALIDATE $? "MySql" 
else 
    echo -e "$G MySql is already there no need to do anything!!! $N" &>> $LOG_FILE 
fi 

dnf list installed nginx 
if [ $? -ne 0 ]
then 
    echo -e "$Y Nginx is not there in your system we are going to install $N" &>>$LOG_FILE
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "Nginx" 
else 
    echo -e "$G Nginx is already there in your system we are not going to do anything" &>> $LOG_FILE 
fi 

dnf list installed python3 &>> $LOG_FILE 
if [ $? -ne 0 ]
then 
    echo -e "$Y Python3 is not there in your system we are going to install $N" &>> $LOG_FILE 
    dnf install python3 -y &>> $LOG_FILE 
    VALIDATE $? "Python3" 
else 
    echo -e "$G Python3 is already there in your system we are nothing to do $N" &>> $LOG_FILE 
fi 

