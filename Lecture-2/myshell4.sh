#Checking exit code commands in the shell script

package=htop

sudo apt intstall #package

if [ $? -eq 0 ]
then
    echo "$package is installed successfully"
    echo "the new command for the package is:"
    which htop
else
    echo "$package is not installed successfully"
fi