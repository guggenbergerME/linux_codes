# Wireguard mit dynamischen DNS Namen

![GIMA_FW_Transfernetz.drawio.png](Wireguard-ClientConfiguration.jpg)

Seit einiger Zeit bin ich großer Fan von Wireguard als VPN Lösung um meine Server und Notebooks zu verbinden. Auch Patrick hatte schon mal über DNS Privacy mit Wireguard geschrieben.

Dabei ist mir ein kleines Problem begegnet, Wireguard hat kein automatisches Handling wenn sich Endpoint Adressen über DNS ändern. In meinem Fall verbinde ich:

+ Server im Rechenzentrum mit fester IP Adresse
+ Notebook irgendwo unterwegs, muss sich zu allen anderen Verbinden
+ Server zuhause, Verbindung nur über DynDNS möglich

![GIMA_FW_Transfernetz.drawio.png](Wireguard-ClientConfiguration.jpg)


### Quelle
+ [Quelle](https://www.netways.de/blog/2022/01/06/wireguard-mit-dynamischen-dns-namen/)
