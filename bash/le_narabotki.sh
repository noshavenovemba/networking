#!/bin/sh # usage: count_types [directory ...] 

#

#!/bin/bash

for i in $@
do
ping -c 1 $i &> /dev/null

if [ $? -ne 0 ]; then
	echo "`date`: ping failed, $i host is down!" | mail -s "$i host is down!" vmorozov.info@gmail.com

fi 
done




find ${*-.} -type f -print | xargs file | 
awk '{ 
	$1=NULL; 
	t[$0]++; 
	} 
END { for (i in t) printf("%d\t%s\n", t[i], i);
 }' | sort -nr # Sort the result numerically, in reverse docstore.mik.ua/orelly/unix/upt/ch16_24.htm

 #! /bin/sh 
temp=/tmp/NOM$$ stat=1 
# ERROR EXIT STATUS (SET TO 0 BEFORE NORMAL EXIT) 
trap 'rm -f $temp; exit $stat' 0 1 2 15 
# MUST HAVE AT LEAST ONE ARGUMENT. ALL MUST BE IN CURRENT DIRECTORY: 
case "$*" in 
"") echo Usage: `basename $0` pattern 1>&2; exit ;; 
*/*) echo "`basename $0` quitting: I can't handle '/'s." 1>&2; exit ;; 
esac 
# GET NAMES WE DON'T WANT TO MATCH; REPLACE BLANKS WITH NEWLINES: 
echo "$*" | tr ' ' '\012' | sort > $temp 
# COMPARE TO CURRENT DIRECTORY (-1 = ONE NAME PER LINE); OUTPUT NAMES WE WANT: 
ls -1 | comm -23 - $temp 
stat=0 

 alias ff "find . -name '*\!{*}*' -ls" docstore.mik.ua/orelly/unix/upt/ch17_04.htm

 find . \( -type d -a -exec chmod 771 {} \; \) -o \ 
 	\( -name "*.BAK" -a -exec chmod 600 {} \; \) -o \ 
 	\( -name "*.sh" -a -exec chmod 755 {} \; \) -o \
 	\( -name "*.txt" -a -exec chmod 644 {} \; \) 

 egrep '^[0-9].*SALE PRICE' `find . -type f -print` 
 # vs
 find . -type f -print | xargs fgrep '$12.99' /dev/null/ #for last argument cause of egrep


 #!/bin/sh # Usage: newname files for x do echo -n "old name is $x, new name is: " read newname mv "$x" "$newname" done docstore.mik.ua/orelly/unix/upt/ch18_13.htm

 alias del "mv \!* ~/trash" 

 23 2 * * * cd $HOME/trash && rm -rf * docstore.mik.ua/orelly/unix/upt/ch23_08.htm



sed 's/^[ [SPACE] [TAB] [CTRL-v] [CTRL-m] ]*$//' 

#!/bin/sed 
-f s/[ ][ ]*/ /g 

#! /bin/sh 
# showmatch - mark string that matches pattern 
pattern=$1; shift 
nawk 'match($0,pattern) > 0 { 
	s = substr($0,1,RSTART-1) 
	m = substr($0,1,RLENGTH) 
	gsub (/[^\b- ]/, " ", s) 
	gsub (/./, "^", m) 
	printf "%s\n%s%s\n", $0, s, m 
}' pattern="$pattern" $* 

