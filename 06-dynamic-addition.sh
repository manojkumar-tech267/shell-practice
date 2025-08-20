#!/bin/bash 

read Number1
read Number2

addition=$((Number1+Number2))
subtraction=$((Number1-Number2))
multiplication=$((Number1*Number2))
division=$((Number1/Number2))

echo "Addition is $addition"
echo "Subtraction is $subtraction"
echo "Multiplication is $multiplication"
echo "Division is $division"