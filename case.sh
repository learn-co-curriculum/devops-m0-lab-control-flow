#!/bin/bash
read -p "Enter a fruit: " fruit

# Fix the case statement so it prints out each result
case
  "apple")
    echo "You entered an apple."
  "banana")
    echo "You entered a banana."
    ;;
    echo "You entered an orange."
    ;;
    echo "You did not enter a valid fruit."
esac
