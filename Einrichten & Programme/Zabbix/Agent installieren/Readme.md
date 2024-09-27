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

Standardmäßig verbindet sich der Zabbix-Server mit dem Agenten. Bei einigen Überprüfungen (z. B. Überwachung der Protokolle) ist jedoch eine umgekehrte Verbindung erforderlich. Für eine korrekte Funktionsweise müssen Sie die Adresse des Zabbix-Servers und einen eindeutigen Hostnamen angeben.

Finden Sie den Abschnitt, der die aktiven Prüfungen konfiguriert, und ändern Sie die Standardwerte:

```
...
##### Active checks related

### Option: ServerActive
#       List of comma delimited IP:port (or DNS name:port) pairs of Zabbix servers and Zabbix proxies for active checks.
#       If port is not specified, default port is used.
#       IPv6 addresses must be enclosed in square brackets if port for that host is specified.
#       If port is not specified, square brackets for IPv6 addresses are optional.
#       If this parameter is not specified, active checks are disabled.
#       Example: ServerActive=127.0.0.1:20051,zabbix.domain,[::1]:30051,::1,[12fc::1]
#
# Mandatory: no
# Default:
# ServerActive=

ServerActive=zabbix_server_ip_address

### Option: Hostname
#       Unique, case sensitive hostname.
#       Required for active checks and must match hostname as configured on the server.
#       Value is acquired from HostnameItem if undefined.
#
# Mandatory: no
# Default:
# Hostname=

Hostname=Second Ubuntu Server
...
```
