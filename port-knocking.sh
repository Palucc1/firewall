#! /bin/bash 

# Limpa as regras de todas as correntes
iptables -F
iptables -X

# Estabelece as políticas padrão das correntes
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

# Rejeita quaisquer conexões na porta 80, exceto as internas (interface lo)
iptables -A INPUT -i lo -j ACCEPT

# Aceita e mantém as conexões já estabelecidas
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

# Aceita conexões na porta 80 livremente
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

# Rejeita outras conexões de entrada
iptables -A INPUT -j DROP
