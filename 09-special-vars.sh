#!/bin/bash 

echo "All Variables Passed $@"
echo "Number of variables passed $#"
echo "Script name $0" 
echo "current directory $PWD"
echo "User Running this script $USER"
echo "Home Directory $HOME"
echo "PID of script $$"
sleep 50 & 
echo "$!"