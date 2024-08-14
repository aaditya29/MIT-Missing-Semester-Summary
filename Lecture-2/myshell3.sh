# checking if a package is installed or not already
# if not installed, then install it

command=/usr/bin/top

if [ -f $command]
then
    echo "the $command command already exists"
else
    echo "$command command does not exist. installing it right now!!!"
    sudo apt update && sudo apt install -y htop
fi

$command