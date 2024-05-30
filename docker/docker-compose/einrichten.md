# Docker Compose einrichten

```
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
```

## Compose ausführbar machen

```
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
```

## Installation testen

```
docker-compose --version
```

Quelle https://docs.docker.com/compose/install/linux/
