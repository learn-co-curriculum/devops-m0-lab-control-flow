#!/bin/bash
var1=1
var2=10
read -p "Enter a number: " num

# This block is missing one line to be complete...
if [[ $var1 -ne 10 ]]
then
  echo "var1 DOES NOT equal 10!"
fi

# Add the if statement that makes this block work
if [[ $var2 -eq 10 ]]
then
  echo "var2 DOES equal 10!"
fi

# Finish the if and elif statements to make this block work
if [[ $num -gt 1000 ]]
then
  echo "num is GREATER than 1000!"
elif [[ $num -lt 1000 ]] && [[ $num -gt 100 ]]
then
  echo "num is LESS THAN 1000 but GREATER THAN 100!"
else
  echo "num is NOT GREATER than 100!"
fi
