# dig

dig (domain information groper) ist ein Programm/Befehl, mit dem Informationen von DNS-Servern abgefragt werden können. DNS bedeutet Domain Name System und wird zur Umwandlung von IP-Adressen in Domains bzw. umgekehrt verwendet. Es basiert auf einer Weltweit verteilten Datenbank. Dig ist ein Client-Programm für DNS-Server wie zum Beispiel der Berkeley Internet Name Domain Server (Bind) und unterstützt sowohl IPv4 als auch IPv6. Dig wird hauptsächlich genutzt, um DNS-Server zu analysieren und zu überprüfen.

## Installation

dig ist ein Bestandteil der dnsutils und kann über das gleichnamige Paket installiert werden [1]:

    dnsutils (universe)

Befehl zum Installieren der Pakete:

    sudo apt-get install dnsutils 

## Benutzung

Der Befehl dig hat die folgende, allgemeine Syntax:

    dig [@Server] [Domain] [Typ] [-x IP-Adresse] 
