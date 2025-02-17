# Server Daten Monitoring

Anlegen eines LXC Container auf dem Server der ein Monitoring benötig

## Update und Installation von lm-sensors

```
apt-get update -y && apt-get upgrade -y
apt-get install -y lm-sensors
```

Funktion prüfen

    sensors

## Telegraf installieren

    sudo apt-get update && sudo apt-get install telegraf

##  Config anpassen

Beispiel einer telegraf.conf Datei

```
[agent]
  interval = "10s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "5s"
  flush_interval = "10s"
  flush_jitter = "5s"
  precision = ""
  hostname = ""
  omit_hostname = false

[[outputs.influxdb_v2]]
  urls = ["http://10.110.0.4:8086"]
  token = "API"
  organization = "NAME"
  bucket = "BUCKET"

[[inputs.cpu]]
[[inputs.disk]]
  ignore_fs = ["tmpfs", "devtmpfs", "devfs", "iso9660", "overlay", "aufs", "squashfs"]
[[inputs.mem]]
[[inputs.net]]
[[inputs.sensors]]
```

## Test

        telegraf -config telegraf.conf -test

Telegraf neu starten

```
systemctl start telegraf
systemctl enable telegraf
systemctl status telegraf
```
