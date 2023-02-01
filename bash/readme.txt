$ echo "This ^ is a test" | sed -n '/s ^/p'
$ echo "tst" | awk '/te{1,2}st/{print $0}'
$ echo "test" | awk '/te{1,2}st/{print $0}'
$ echo "teest" | awk '/te{1,2}st/{print $0}'
$ echo "teeest" | awk '/te{1,2}st/{print $0}'

// number of files in each directory
#!/bin/bash
mypath=$(echo $PATH | sed 's/:/ /g')
count=0
for directory in $mypath
do
check=$(ls $directory)
for item in $check
do
count=$[ $count + 1 ]
done
echo "$directory - $count"
count=0
done

#!/usr/bin/expect -f
set timeout -1
spawn ./questions
expect {
    "*topic?" { send -- "Programming\r" }
    "*movie?" { send -- "Star wars\r" }
}

#!/bin/bash
function factorial {
if [ $1 -eq 1 ]
then
echo 1
else
local temp=$(( $1 - 1 ))
local result=$(factorial $temp)
echo $(( $result * $1 ))
fi
}
read -p "Enter value: " value
result=$(factorial $value)
echo "The factorial of $value is: $result"

function myfunc {
value=$(( $value + 10 ))
}
read -p "Enter a value: " value
myfunc
echo "The new value is: $value"

#!/bin/bash
while [ -n "$1" ]
do
case "$1" in
-a) echo "Found the -a option";;
-b) param="$2"
echo "Found the -b option, with parameter value $param"
shift ;;
-c) echo "Found the -c option";;
--) shift
break ;;
*) echo "$1 is not an option";;
esac
shift
done
count=1
for param in "$@"
do
echo "Parameter #$count: $param"
count=$(( $count + 1 ))
done

#!/bin/bash
user=vadmin
if grep $user /etc/passwd
then
echo "The user $user Exists"
#elif
#useradd
else
echo "The user $user doesn’t exist"
fi

#!/bin/bash
IFS=$'\n'
for entry in $(cat /etc/passwd)
do
echo "Values in $entry –"
IFS=:
for value in $entry
do
echo " $value"
done

#!/bin/bash
echo
while [ -n "$1" ]
do
case "$1" in
-a) echo "Found the -a option" ;;
-b) echo "Found the -b option" ;;
-c) echo "Found the -c option" ;;
*) echo "$1 is not an option" ;;
esac
shift
done

for var in $(cat $file)
do
echo var
done >> file.txt

IFS=$'\n' // env var for separate - new line
-n str1 // if str \> 0 then True
-z str1 // if str1 = 0 then True
-e file // file exists
-d file // file exists and directory
-f file // file exists and file
-s file // file and not empty
file1 -ot file2 // file1 older then file2
$1
$# // how many parameters were passed
${!#} // the last parameter
$* // all parameters as single word
$@ // separate to different words
$@ // $1 $2

read -p "Enter your name: "
echo Hello $REPLY, welcome to my program.

#!/bin/bash
if read -t 5 -p "Enter your name: " name
then
echo "Hello $name, welcome to my script"
else
echo "Sorry, too slow! "
fi

#!/bin/bash
count=1
cat myfile | while read line
do
echo "Line $count: $line"
count=$(( $count + 1 ))
done
echo "Finished"
