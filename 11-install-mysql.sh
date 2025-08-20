#!/bin/bash 

userid=$(id -u)
if [ $userid -ne 0 ]
then 
    echo "[ERROR] You are not running as root. Please execute this script with root privileges." 
    exit 1
else 
    echo "[INFO] Root access confirmed. Proceeding with MySQL installation check."
fi

dnf list installed mysql
if [ $? -ne 0 ]
then 
    echo "[INFO] MySQL is not installed. Starting installation..."
    dnf install mysql -y 
    if [ $? -eq 0 ]
    then 
        echo "[SUCCESS] MySQL has been installed successfully."
    else 
        echo "[FAILURE] MySQL installation failed. Please check your package manager and network connection." 
        exit 1 
    fi 
else 
    echo "[INFO] MySQL is already installed. No further action is required."
fi 

