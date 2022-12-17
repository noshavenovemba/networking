--- services and configs ---
journalctl - /etc/systemd/journald.conf

/etc/unbound/unbound.confg // caching server for DNS entries

rpm -qf /sbin/dnsmasq
yum remove dnsmasq

proc/sys/net/ipv4 // directory contains settings for communicating with a host directly connected to the system

dig TXT +short o-o.myaddr.l.google.com @ns1.google.com

curl -v telnet://3.82.22.69:30432

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

/usr/spool/cron/crontabs/chavez // docstore.mik.ua/orelly/unix/upt/ch40_13.htm

--- commands ---
free –m // this is the simplest command where it will show the memory usage in MB.
vmstat –s //this command gives a report on virtual memory statistics
top // this command checks the usage of memory and cpu usage
htop // similar like top command
logger -p // add messages to the /var/log/syslog from the command line or other files


--- scripts etc ---

yes | del * // docstore.mik.ua/orelly/unix/upt/ch23_04.htm

alias lr "ls -lagFqt \!* | head" // docstore.mik.ua/orelly/unix/upt/ch16_09.htm

find . ! -perm -0100 -size +1 -type f -print | xargs gzip -v // docstore.mik.ua/orelly/unix/upt/ch24_12.htm

s/\<./\u&/g // docstore.mik.ua/orelly/unix/upt/ch30_17.htm
