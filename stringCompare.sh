#!/bin/bash
read -p "String1: " str1
read -p "String2: " str2

if [[ -z "$str1" || -z "$str2" ]]
then
    echo "Please enter two strings"
else
    if [[ "$str1" == "$str2" ]]
    then
        echo "Strings are equal"
    else
        echo "Strings are not equal"
    fi
fi
# -z returns true if the length of the string is zero
# -n returns true if the length of the string is non-zero
# -eq returns true if the two strings are equal
# -ne returns true if the two strings are not equal
# -lt returns true if the first string is less than the second string 
# -le returns true if the first string is less than or equal to the second string
# -gt returns true if the first string is greater than the second string
# -ge returns true if the first string is greater than or equal to the second string

# -o returns true if either of the strings is true
# -a returns true if both the strings are true
# ! returns true if the string is false
# = returns true if the two strings are equal
# != returns true if the two strings are not equal
# < returns true if the first string is less than the second string
# > returns true if the first string is greater than the second string
# Integer comparison examples
# num1=10
# num2=20

# if [[ $num1 -eq $num2 ]]
# then
#     echo "Numbers are equal"
# else
#     echo "Numbers are not equal"
# fi

# if [[ $num1 -lt $num2 ]]
# then
#     echo "$num1 is less than $num2"
# fi

# if [[ $num1 -le $num2 ]]
# then
#     echo "$num1 is less than or equal to $num2"
# fi

# if [[ $num1 -gt $num2 ]]
# then
#     echo "$num1 is greater than $num2"
# fi

# if [[ $num1 -ge $num2 ]]
# then
#     echo "$num1 is greater than or equal to $num2"
# fi
# -----------------------------------------------------------------------------------------------------
# String comparison examples
# str1="apple"
# str2="banana"

# if [[ "$str1" < "$str2" ]]
# then
#     echo "\"$str1\" is less than \"$str2\""
# fi

# if [[ "$str1" > "$str2" ]]
# then
#     echo "\"$str1\" is greater than \"$str2\""
# fi

# if [[ "$str1" != "$str2" ]]
# then
#     echo "\"$str1\" is not equal to \"$str2\""
# fi