#!/bin/bash 

userid=$(id -u);

R="\e[31m"
G="\e[32m"
Y="\e[33m" 
N="\e[0m" 

packages=("mysql" "nginx" "python3")

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executing at:  $(date)" | tee -a $LOG_FILE 

if [ $userid -ne 0 ]
then 
    echo -e "$Y Please!!!$N run with root access" | tee -a  $LOG_FILE 
    exit 1 
else 
    echo -e "$G You Are running with root access $N" &>> $LOG_FILE | tee -a $LOG_FILE   
fi 

VALIDATE()
{
    if [ $1 -eq 0 ]
    then 
        echo -e "$G $2 installed Properly $N" | tee -a $LOG_FILE  
    else 
        echo -e "$R $2 Not installed properly $N" | tee -a $LOG_FILE 
        exit 1
    fi 
}

for package in ${packages[@]}
do 
    dnf list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]
    then 
        echo "$package not installed now we are going to install" | tee -a $LOG_FILE 
        dnf install $package -y &>> $LOG_FILE 
        if [ $? eq 0 ]
        then 
            echo "$package installed successfully" | tee -a $LOG_FILE 
        else 
            echo "$package not installed successfully" | tee -a $LOG_FILE 
        fi 
    else 
        echo "$package is already installed we are nothing to do" | tee -a $LOG_FILE 
    fi
done 
