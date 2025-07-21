# So installierst du den TIG Stack (Telegraf, InfluxDB und Grafana) auf Ubuntu 22.04

## Firewall konfigurieren

Bevor du die Pakete installierst, musst du als erstes die Firewall so konfigurieren, dass sie die Ports für InfluxDB und Grafana öffnet.

Überprüfe den Status der Firewall.

    sudo ufw status

Du solltest etwas wie das Folgende sehen.
```
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
```
Öffne Port 8086 für InfluxDB und 3000 für den Grafana-Server.

    sudo ufw allow 8086
    sudo ufw allow 3000

Überprüfe den Status zur Bestätigung noch einmal.

    sudo ufw status

```
Status: active

To                         Action      From
--                         ------      ----
OpenSSH                    ALLOW       Anywhere
8086                       ALLOW       Anywhere
3000                       ALLOW       Anywhere
OpenSSH (v6)               ALLOW       Anywhere (v6)
8086 (v6)                  ALLOW       Anywhere (v6)
3000 (v6)                  ALLOW       Anywhere (v6)
```

## Install InfluxDB
[Quelle](https://docs.influxdata.com/influxdb/v2/install/?t=Linux) der Installation.

Kontrolle ob curl und gpg installiert ist.

```
apt install curl gpg -y
```

```
# Ubuntu and Debian
# Add the InfluxData key to verify downloads and add the repository
curl --silent --location -O \
https://repos.influxdata.com/influxdata-archive.key
echo "943666881a1b8d9b849b74caebf02d3465d6beb716510d86a39f6c8e8dac7515  influxdata-archive.key" \
| sha256sum --check - && cat influxdata-archive.key \
| gpg --dearmor \
| tee /etc/apt/trusted.gpg.d/influxdata-archive.gpg > /dev/null \
&& echo 'deb [signed-by=/etc/apt/trusted.gpg.d/influxdata-archive.gpg] https://repos.influxdata.com/debian stable main' \
| tee /etc/apt/sources.list.d/influxdata.list
# Install influxdb
sudo apt-get update && sudo apt-get install influxdb2
```
InfluxDB starten
```
sudo service influxdb start
```
Status
```
sudo service influxdb status
```

## InfluxDB-Datenbank und Benutzeranmeldeinformationen erstellen

Um die Daten von Telegraf zu speichern, musst du die Influx-Datenbank und den Benutzer einrichten.

InfluxDB wird mit einem Kommandozeilen-Tool namens influx ausgeliefert, mit dem du mit dem InfluxDB-Server interagieren kannst. Stell dir influx als das mysql Kommandozeilentool vor.

Führe den folgenden Befehl aus, um die erste Konfiguration für Influx vorzunehmen.

Passwort ezeugen

    gpg --gen-random --armor 1 12


```
$ influx setup
> Welcome to InfluxDB 2.0!
? Please type your primary username navjot
? Please type your password ***************
? Please type your password again ***************
? Please type your primary organization name howtoforge
? Please type your primary bucket name tigstack
? Please type your retention period in hours, or 0 for infinite 360
? Setup with these parameters?
  Username:          navjot
  Organization:      howtoforge
  Bucket:            tigstack
  Retention Period:  360h0m0s
 Yes
User    Organization    Bucket
navjot  howtoforge      tigstack
```
Du musst deinen anfänglichen Benutzernamen, dein Passwort, den Namen deiner Organisation, den Namen des primären Buckets, in dem die Daten gespeichert werden, und die Aufbewahrungsfrist in Stunden für diese Daten festlegen. Deine Angaben werden in der Datei /home/username/.influxdbv2/configs gespeichert.

Du kannst diese Einrichtung auch vornehmen, indem du die URL http://<serverIP>:8086/ in deinem Browser aufrufst. Sobald du die Ersteinrichtung durchgeführt hast, kannst du dich mit den oben erstellten Anmeldedaten bei der URL anmelden.

## Telegraf installieren
Telegraf und InfluxDB teilen sich das gleiche Repository. Das bedeutet, dass du Telegraf direkt installieren kannst.

```
sudo apt install telegraf
```
Der Dienst von Telegraf wird während der Installation automatisch aktiviert und gestartet.

Telegraf ist ein Plugin-gesteuerter Agent und verfügt über 4 Arten von Plugins:

  + Input-Plugins sammeln Metriken.
  + Prozessor-Plugins transformieren, dekorieren und filtern Metriken.
  + Aggregator-Plugins erstellen und aggregieren Metriken.
  + Output-Plugins definieren die Ziele, an die die Metriken gesendet werden, einschließlich InfluxDB.

Telegraf speichert seine Konfiguration für alle diese Plugins in der Datei /etc/telegraf/telegraf.conf. Der erste Schritt besteht darin, Telegraf mit InfluxDB zu verbinden, indem du das Output-Plugin influxdb_v2 aktivierst. Öffne die Datei /etc/telegraf/telegraf.conf zum Bearbeiten.
```
$ sudo nano /etc/telegraf/telegraf.conf
```
Finde die Zeile [[outputs.influxdb_v2]] und kommentiere sie aus, indem du das # vor der Zeile entfernst. Bearbeite den Code darunter auf folgende Weise.
```
# # Configuration for sending metrics to InfluxDB 2.0
 [[outputs.influxdb_v2]]
#   ## The URLs of the InfluxDB cluster nodes.
#   ##
#   ## Multiple URLs can be specified for a single cluster, only ONE of the
#   ## urls will be written to each interval.
#   ##   ex: urls = ["https://us-west-2-1.aws.cloud2.influxdata.com"]
   urls = ["http://127.0.0.1:8086"]
#
#   ## Token for authentication.
   token = "$INFLUX_TOKEN"
#
#   ## Organization is the name of the organization you wish to write to.
   organization = "howtoforge"
#
#   ## Destination bucket to write into.
   bucket = "tigstack"
```
Füge den zuvor gespeicherten Wert des InfluxDB-Tokens anstelle der Variable $INFLUX_TOKEN in den obigen Code ein.

Suche nach der Zeile INPUT PLUGINS und du wirst sehen, dass die folgenden Eingabe-Plugins standardmäßig aktiviert sind.
```
# Read metrics about cpu usage
[[inputs.cpu]]
  ## Whether to report per-cpu stats or not
  percpu = true
  ## Whether to report total system cpu stats or not
  totalcpu = true
  ## If true, collect raw CPU time metrics
  collect_cpu_time = false
  ## If true, compute and report the sum of all non-idle CPU states
  report_active = false
  ## If true and the info is available then add core_id and physical_id tags
  core_tags = false


# Read metrics about disk usage by mount point
[[inputs.disk]]
  ## By default stats will be gathered for all mount points.
  ## Set mount_points will restrict the stats to only the specified mount points.
  # mount_points = ["/"]

  ## Ignore mount points by filesystem type.
  ignore_fs = ["tmpfs", "devtmpfs", "devfs", "iso9660", "overlay", "aufs", "squashfs"]

  ## Ignore mount points by mount options.
  ## The 'mount' command reports options of all mounts in parathesis.
  ## Bind mounts can be ignored with the special 'bind' option.
  # ignore_mount_opts = []


# Read metrics about disk IO by device
[[inputs.diskio]]
....
....

# Get kernel statistics from /proc/stat
[[inputs.kernel]]
  # no configuration


# Read metrics about memory usage
[[inputs.mem]]
  # no configuration
  
# Get the number of processes and group them by status
[[inputs.processes]]
  # no configuration


# Read metrics about swap memory usage
[[inputs.swap]]
  # no configuration


# Read metrics about system load & uptime
[[inputs.system]]
  # no configuration
```
Du kannst je nach Bedarf weitere Input-Plugins konfigurieren, z. B. Apache Server, Docker-Container, Elasticsearch, iptables firewall, Kubernetes, Memcached, MongoDB, MySQL, Nginx, PHP-fpm, Postfix, RabbitMQ, Redis, Varnish, Wireguard, PostgreSQL usw. Es gibt auch einen InfluxDB python client.

Wenn du fertig bist, speichere die Datei, indem du Strg + X drückst und Y eingibst, wenn du dazu aufgefordert wirst.

Starte den Telegraf-Dienst neu, nachdem du die Änderungen vorgenommen hast.
```
sudo systemctl restart telegraf
```
## Überprüfe, ob die Telegraf-Statistiken in InfluxDB gespeichert werden

Bevor du fortfährst, musst du überprüfen, ob die Telegraf-Statistiken korrekt erfasst und in die InfluxDB eingespeist werden. Öffne die InfluxDB-Benutzeroberfläche in deinem Browser, klicke auf das dritte Symbol in der linken Seitenleiste und wähle das Menü Buckets.

Klicke auf tigstack und du solltest die folgende Seite sehen.

Klicke auf den Bucket-Namen und dann auf einen der Werte im Filter _measurement und klicke immer wieder auf andere Werte, wenn sie erscheinen. Wenn du fertig bist, klicke auf die Schaltfläche Senden. Oben solltest du ein Diagramm sehen. Es kann sein, dass du einige Zeit warten musst, bis die Daten angezeigt werden.

Das sollte dir bestätigen, dass die Daten korrekt weitergegeben werden.

## Grafana installieren

Wir verwenden das offizielle Grafana-Repository, um es zu installieren. Importiere den Grafana GPG-Schlüssel.
```
sudo wget -q -O /usr/share/keyrings/grafana.key https://packages.grafana.com/gpg.key
```
Füge das Repository zu deinem System hinzu.
```
echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
```
Aktualisiere die Repository-Liste des Systems.
```
sudo apt update
```
Installiere Grafana.
```
sudo apt install grafana
```
Starte und aktiviere den Grafana-Dienst.
```
sudo systemctl enable grafana-server --now
```
Überprüfe den Status des Dienstes.
```
sudo systemctl status grafana-server
? grafana-server.service - Grafana instance
     Loaded: loaded (/lib/systemd/system/grafana-server.service; enabled; vendor preset: enabled)
     Active: active (running) since Tue 2022-09-13 01:04:47 UTC; 2s ago
       Docs: http://docs.grafana.org
   Main PID: 13674 (grafana-server)
      Tasks: 7 (limit: 1030)
     Memory: 104.6M
        CPU: 1.050s
     CGroup: /system.slice/grafana-server.service
             ??13674 /usr/sbin/grafana-server --config=/etc/grafana/grafana.ini --pidfile=/run/grafana/grafana-server.pid --packaging=deb cfg:default.paths.logs=/var/log/grafana 
```

## Grafana starten
Grafana-Datenquelle einrichten
Starte die URL http://<serverIP>:3000 in deinem Browser und die folgende Grafana-Anmeldeseite sollte dich begrüßen.

Erstes Login ```admin/admin```

### Links
+ [Anleitung](https://www.howtoforge.de/anleitung/so-installierst-du-den-tig-stack-telegraf-influxdb-und-grafana-auf-ubuntu-22-04/)
