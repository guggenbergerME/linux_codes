# So installierst du den TIG Stack (Telegraf, InfluxDB und Grafana) auf Ubuntu 22.04

## Install InfluxDB
[Quelle](https://docs.influxdata.com/influxdb/v2/install/?t=Linux) der Installation.

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


### Links
+ [Anleitung](https://www.howtoforge.de/anleitung/so-installierst-du-den-tig-stack-telegraf-influxdb-und-grafana-auf-ubuntu-22-04/)
