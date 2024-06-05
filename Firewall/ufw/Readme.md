# ufw Firewall
UFW (oder Uncomplicated Firewall) ist eine vereinfachte Firewall-Verwaltungsschnittstelle, die die Komplexität von 
Paketfilterungstechnologie auf niedriger Ebene wie iptables und nftables versteckt. Wenn Sie mit dem Sichern Ihres 
Netzwerks beginnen möchten und Sie nicht sicher sind, welches Tool Sie verwenden sollen, könnte UFW die richtige Wahl für Sie sein.

## Verwenden von IPv6 mit UFW (optional)
Wenn auf Ihrem Ubuntu-Server IPv6 aktiviert ist, muss UFW so konfiguriert sein, dass IPv6 unterstützt wird.
  sudo nano /etc/default/ufw
Stellen Sie dann sicher, dass der Wert von IPV6 yes lautet. Das sollte wie folgt aussehen:
  IPV6=yes

  
