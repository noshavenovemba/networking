adhoc commands

ansible testservers -m command -a uptime -i ansible_hosts
ansible testservers -m command -a "uname -a" -i ansible_hosts
