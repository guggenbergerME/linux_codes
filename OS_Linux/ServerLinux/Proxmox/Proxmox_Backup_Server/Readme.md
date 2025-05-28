# Proxmox Backup Server

## Proxmox Backup Server No Subscription Update Repository

Der Proxmox-Backup-Server bietet für Produktiv-Systeme Subscriptions an, mit denen man getestete Updates sowieso Support bei Proxmox erhält. Für bestimmte Test-Systeme möchte man ggf. keine Subscription kaufen. Die Thomas-Krenn.AG empfiehlt für Produktiv-Systeme den Einsatz von Proxmox Backup Server Subscriptions. Proxmox Backup Server Subscriptions sind die einzige Möglichkeit die ständige Weiterentwicklung von Proxmox VE und Proxmox PBS zu finanzieren und zu fördern. Möchte man trotzdem ein No-Subscription Repository verwenden tritt folgender Fehler nach der Default-Installation auf wenn man via
```
apt update && apt dist-upgrade
```
ein Upgrade des PBS starten möchte.
```
E: Failed to fetch https://enterprise.proxmox.com/debian/pbs/dists/buster/InRelease  401  Unauthorized [IP: 212.224.xxx.xxx 443]
E: The repository 'https://enterprise.proxmox.com/debian/pbs buster InRelease' is not signed.
```
Um auf das pbs-no-subscription Repository wechseln zu können, muss man die Repository-Datei editieren:

```
nano /etc/apt/sources.list.d/pbs-enterprise.list
```
und folgenden Inhalt in die Datei kopieren / bzw. die folgenden Änderungen vornehmen. Hier wurde das Enterprise Repository auskommentiert und das no-subscription Repository hinzugefügt (http beachten, beim no-subscription Repo wird im Gegensatz zum Enterprise-Repository kein https eingesetzt)
```
# deb https://enterprise.proxmox.com/debian/pbs buster pbs-enterprise
deb http://download.proxmox.com/debian/pbs buster pbs-no-subscription
```
Danach funktioniert der Update Vorgang auch ohne Subscription.
