#!/bin/zsh

#checking the existence of the file
while [ -f ~/testfile ]
do
    echo "The file exists in the home directory"
done

echo "The file does not exist in the home directory"