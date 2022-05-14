#! /bin/bash

# Limpa regras anteriores/correntes
iptables -F
iptables -X

# Estabelece as políticas padrão
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT

# Rejeita quaisquer conexões na porta 80
iptables -A INPUT -i eth0 -p tcp --dport 80 -j REJECT
