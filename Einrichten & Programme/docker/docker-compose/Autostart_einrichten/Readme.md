# Docker Compose Autostart

## Docker service Starten beim Systemstart

```
systemctl enable docker
```

Im docker-compose.yml den Autostarteintrag einfügen
```
restart: always
```

Neuer up Befehl
```
docker compose up -d
```
