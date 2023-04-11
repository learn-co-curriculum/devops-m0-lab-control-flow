#!/bin/bash
read -p "Enter a number: " num

# Complete the block so that it keeps looping while num is greater than 0
do
  num=$((num-1))
  echo $num
done
