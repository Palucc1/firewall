#! /bin/bash

# Limpa regras anteriores/correntes
iptables -F
iptables -X

# Estabelece as pol�ticas padr�o
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Rejeita quaisquer conex�es na porta 80
iptables -A INPUT -i eth0 -p tcp --dport 80 -j REJECT
