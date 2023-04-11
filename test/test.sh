#!/bin/bash
chmod +x ../if.sh
chmod +x ../for.sh
chmod +x ../while.sh
chmod +x ../case.sh

# IF
output=$(../if.sh << EOF
1500
EOF
)
line_number=0
while IFS= read -r line
do
  line="${line,,}"
  case $line_number in 
    0)
      if [[ "$line" == *"var1 does not equal 10!"* ]]; then
        lg -r p -m "First if block"
      else
        lg -r f -m "First if block"
      fi
      ;;
    1)
      if [[ "$line" == *"var2 does equal 10!"* ]]; then
        lg -r p -m "Second if block"
      else
        lg -r f -m "Second if block"
      fi
      ;;
    2)
      if [[ "$line" == *"num is greater than 1000!"* ]]; then
        lg -r p -m "Third if block"
      else
        lg -r f -m "Third if block"
      fi
      ;;
  esac
  line_number=$((line_number + 1))
done <<< "$output"
echo "$output"

# FOR
output=$(../for.sh)
output=$(echo $output|tr -d '\n')
if [[ "$output" == *"1 2 3 4"* ]]; then
  lg -r p -m "First for block"
else
  lg -r f -m "First for block"
fi
if [[ "$output" == *"1 1 2 3"* ]]; then
  lg -r p -m "Second for block"
else
  lg -r f -m "Second for block"
fi
if [[ "$output" == *"2 4 6 8"* ]]; then
  lg -r p -m "Third for block"
else
  lg -r f -m "Third for block"
fi
echo "$output"

# WHILE
output=$(../while.sh << EOF
12
EOF
)
output=$(echo $output|tr -d '\n')
if [[ "$output" == *"11 10 9 8 7 6 5 4 3 2 1 0"* ]]; then
  lg -r p -m "Testing while block"
else
  lg -r f -m "Testing while block"
fi
echo "$output"

# CASE
output=$(../case.sh << EOF
apple
EOF
)
if [[ "$output" == *"entered an apple"* ]]; then
  lg -r p -m "Testing case with apple"
else
  lg -r f -m "Testing case with apple"
fi
echo "$output"

output=$(../case.sh << EOF
orange
EOF
)
if [[ "$output" == *"entered an orange"* ]]; then
  lg -r p -m "Testing case with orange"
else
  lg -r f -m "Testing case with orange"
fi
echo "$output"

output=$(../case.sh << EOF
strawberry
EOF
)
if [[ "$output" == *"did not enter a valid fruit"* ]]; then
  lg -r p -m "Testing case with invalid fruit"
else
  lg -r f -m "Testing case with invalid fruit"
fi
echo "$output"
