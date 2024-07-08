# AdGuard auf der OPNsense

## Installation
login per ssh auf der FW und wechseln in das Terminal mit der Zahl ```8```.

```
fetch -o /usr/local/etc/pkg/repos/mimugmail.conf https://www.routerperformance.net/mimugmail.conf
```

anschliessend ein

```
pkg update
```

Nun ist das entsprechnende Paket im Bereich

```
System / Pakete / Erweiterungen / os-adguardhome-maxit
```

zu finden. Dieses Paket nun aktivieren!

## AdGuard setup

AdGuard nun aktivieren
```
Dienste / Adguardhome / Allgemein
```

### DNS Setup

Da DNS standardmäßig auf Port 53 lauscht, möchten wir, dass AdGuard Home auch auf diesem Port lauscht, um uns das Leben zu erleichtern. Standardmäßig führt OPNsense auf diesem Port bereits Unbound aus. Wir müssen dies ändern, damit es nicht zu Konflikten kommt.

Navigieren Sie zu

```
Dienste / Unbound DNS / Allgmeine
```


Ändern Sie den Listen-Port in ```5353```

Aktivieren Sie Register DHCP leasesund Register DHCP static mappings.
Dadurch werden Hostnamen in AdGuard Home für uns aufgelöst.

Speichern Sie die Einstellungen.

## AdGuard webGUI

Jetzt können wir AdGuard Home selbst konfigurieren. Ich werde hier nicht auf alle Konfigurationen eingehen, aber einige Dinge sind erforderlich, damit dies optimal mit OPNsense funktioniert.

Navigiere zur
```
http://[FW-IOP]:3000/
```

Stellen Sie die Admin-Oberfläche so ein, dass nur die IP-Adresse Ihres Routers abgehört wird (häufig 192.168.1.1), dieselbe IP-Adresse, die Sie auch bei der Konfiguration von OPNsense selbst verwenden. Stellen Sie den Port außerdem auf ein ```8080```.

Der DNS-Server kann alle Schnittstellen abhören und den Standardport verwenden ```53```.



