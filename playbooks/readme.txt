adhoc commands

ansible testservers -m command -a uptime -i ansible_hosts
ansible testservers -m command -a "uname -a" -i ansible_hosts

ansible-playbook --syntax-check vsftpd.yml
ansible-playbook --vvv vsftpd.yml //details

ansible-vault // encrypt and decrypt files

ansible -m setup all // gather all facts or with (debug: var: ansible facts)

debug:
  msg: > this is ip address {{ansible_facts.default_ipv4.address}}

-filter="" // address to exact facts
