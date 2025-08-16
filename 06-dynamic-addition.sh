#!/bin/bash 

read num1;
read num2;

addition=$((num1+num2))
subtraction=$((num1-num2))
multiplication=$((num1*num2))
division=$((num1/num2))

echo "${addition}, ${subtraction}, ${multiplication}, ${division}"