handlers // notify -> handler, if change is made on a machine, then restart
modules: lineinfile, blockinfile, copy, fetch
register // to store output of commands
block // -> rescue(else) -> always(continue)


ansible testservers -m command -a "uname -a" -i ansible_hosts
ansible-playbook --syntax-check vsftpd.yml
ansible-playbook --vvv vsftpd.yml //details
ansible -m setup all // gather all facts or with (debug: var: ansible facts) -filter="" // address to exact facts

ansible-vault // encrypt and decrypt files

debug:
  msg: > this is ip address {{ansible_facts.default_ipv4.address}}

--------- loop ---------
- name: create user
  user:
    name {{item.name}}
   loop:
    - name: first
    - name: second

changed_when // failuers
