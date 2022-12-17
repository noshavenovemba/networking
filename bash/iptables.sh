#!/bin/bash

#list all to stdout
iptables -L 

#allow
iptables -A INPUT -S 10.0.0.0/8 -p tcp -dport 22 -j ACCEPT
iptables -A INPUT -I lo -j ACCEPT
iptables -A OUTPUT -m state —state ESTABLISHED,RELATED -j ACCPET
Iptables -A INPUT -p ump —sport 53 -j ACCEPT

#deny
Iptables -P INPUT DROP
Iptables -P OUTPUT DROP

#block everything
sudo iptables -t filter -P INPUT DROP
sudo iptables -t filter -P FORWARD DROP
sudo iptables -t filter -P OUTPUT DROP

#authorize already established connexions
sudo iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -t filter -A INPUT -i lo -j ACCEPT
sudo iptables -t filter -A OUTPUT -o lo -j ACCEPT

#allow icmp
sudo iptables -t filter -A INPUT -p icmp -j ACCEPT
sudo iptables -t filter -A OUTPUT -p icmp -j ACCEPT

#allow ssh
sudo iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -t filter -A OUTPUT -p tcp --dport 22 -j ACCEPT
