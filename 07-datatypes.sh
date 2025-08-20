#!/bin/bash 

timestamp=$(date)
date=$(date +%F)
Number1=100
Number2=200

echo "$timestamp"
echo "$date" 
echo "$((Number1+Number2))"