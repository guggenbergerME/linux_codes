# Grafana Iframe

## Fehler Firefox

+ Grafana iframe keine Anzeige in Firefox

## Konfiguration der ini

    nano /etc/grafana/grafana.ini

## Eingabe in der grafana,ini

    allow_embedding=true

```
[auth.anonymous]
enabled = true
```

## Grafan neu starten

    service grafana-server restart
