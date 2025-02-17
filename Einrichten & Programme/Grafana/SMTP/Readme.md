# Email Benachrichtigung

## Einstellen des SMTP Servers

Editieren der ini Datei von Grafana

```
nano /etc/grafana/grafana.ini
```

Suchen des Eintrages SMTP

Ändern der Konfiguration im Bereich SMTP

```
################################### SMTP / Emailing ##########################
[smtp]
enabled = true
host = mail.gima-profi.info:587
user = grafana@gima-profi.info
# If the password contains # or ; you have to wrap it with triple quotes. Ex """#password;"""
password = XXXX
;cert_file =
;key_file =
skip_verify = true
from_address = grafana@gima-profi.info
from_name = Grafana - Alarm
# EHLO identity in SMTP dialog (defaults to instance_name)
;ehlo_identity = dashboard.example.com
# SMTP startTLS policy (defaults to 'OpportunisticStartTLS')
;startTLS_policy = NoStartTLS
# Enable trace propagation in e-mail headers, using the 'traceparent', 'tracestate' and (optionally) 'baggage' fields (defaults to false)
;enable_tracing = false

```

### Weitere Links
+ [Video Anleitung](https://www.youtube.com/watch?v=U69YYWV7BW0)
