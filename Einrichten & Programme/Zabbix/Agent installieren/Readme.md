# Zabbiy Agent installieren

## Ubuntu
```
apt-get install zabbix-agent
```
### Agent konfig

Agent starten
```
systemctl start zabbix-agent
```

Konfiguration des Agenten ändern
```
/etc/zabbix/zabbix_agentd.conf
```
Eintragen der Zabbix Server IP
```
...
Server=zabbix_server_ip_address
...
```
