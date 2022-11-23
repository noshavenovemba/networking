#!/bin/bash

is_alive_ping()
{
	ping -c 1 $1 > /dev/null
	[ $? -eq 0 ] && echo Node with ip $i is up
}

for i in 192.168.1.{1..5}
do
is_alive_ping $i & disown
done
exit

#for i in $@
#do
#ping -c 1 $i &> /dev/null

#if [ $? -ne 0 ]; then
#	echo "`date`: ping failed, $i host is down!" | mail -s "$i host is down!" vmorozov.info@gmail.com

#fi 
#done
