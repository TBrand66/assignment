#!/bin/bash

File="ssh_config"

ssh_file="temp_config"

if [[ -f $ssh_file ]]
then
    rm -f $ssh_file
fi

touch $ssh_file

while read line
do
    check_ssh=$( echo $line | grep PasswordAuthentication )
    if [[ $check_ssh ]]
    then
        echo "PasswordAuthentication Yes">>$ssh_file 
    else
        echo $line>>$ssh_file
    fi
done < $File

rm -f $File
mv $ssh_file $File