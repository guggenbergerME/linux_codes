# FHEM / mqtt2 / Codes

## Schalten von mqtt2 Kanälen
Geschalten werden die mqtt2 Kanäle per ```setList```. Eingeben der Codes über die FHEM Oberfläche im Bereich setList.

Beispiel

```
defmod Werktor MQTT2_DEVICE GIMAmqtt
attr Werktor readingList GIMAmqtt:Werktor/K0:.* K0\
GIMAmqtt:Werktor/K1:.* K1\
GIMAmqtt:Werktor/K2:.* K2\
GIMAmqtt:Werktor/K3:.* K3\
GIMAmqtt:Werktor/K4:.* K4\
GIMAmqtt:Werktor/K5:.* K5\
GIMAmqtt:Werktor/K6:.* K6\
GIMAmqtt:Werktor/K7:.* K7\
GIMAmqtt:/Werktor/K1:.* K1\
GIMAmqtt:/Werktor/K1/:.* K1
attr Werktor room MQTT2_DEVICE
attr Werktor setList on Werktor/K1 on\
off Werktor/K1 off
attr Werktor webCmd on:off
```
