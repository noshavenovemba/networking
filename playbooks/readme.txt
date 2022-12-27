adhoc commands

ansible testservers -m command -a uptime -i ansible_hosts
ansible testservers -m command -a "uname -a" -i ansible_hosts

ansible-playbook --syntax-check vsftpd.yml
ansible-playbook --vvv vsftpd.yml //details

ansible-vault // encrypt and decrypt files
