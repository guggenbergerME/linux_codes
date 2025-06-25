# Docmost

Docmost ist eine Open-Source-Software für kollaborative Wikis und Dokumentationen. Es ist eine Alternative zu Notion und Confluence und ermöglicht es mehreren Benutzern, gleichzeitig an derselben Seite in Echtzeit zu arbeiten. 

## Docker installation

1. Setup the Docker compose file
Create a new directory for Docmost and download the Docker compose file with commands below:
```
mkdir docmost
cd docmost
curl -O https://raw.githubusercontent.com/docmost/docmost/main/docker-compose.yml
```

Next, open the docker-compose.yml file. On Linux, you can use vim:
```
nano docker-compose.yml
```
The downloaded docker-compose.yml file should contain the template below with default environment variables.

INFO
APP_URL should be the domain you can access docmost from. e.g https://docmost.example.com

docmost/docker-compose.yml
```
version: "3"

services:
  docmost:
    image: docmost/docmost:latest
    depends_on:
      - db
      - redis
    environment:
      APP_URL: "http://localhost:3000"
      APP_SECRET: "REPLACE_WITH_LONG_SECRET"
      DATABASE_URL: "postgresql://docmost:STRONG_DB_PASSWORD@db:5432/docmost?schema=public"
      REDIS_URL: "redis://redis:6379"
    ports:
      - "3000:3000"
    restart: unless-stopped
    volumes:
      - docmost:/app/data/storage

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: docmost
      POSTGRES_USER: docmost
      POSTGRES_PASSWORD: STRONG_DB_PASSWORD
    restart: unless-stopped
    volumes:
      - db_data:/var/lib/postgresql/data

  redis:
    image: redis:7.2-alpine
    restart: unless-stopped
    volumes:
      - redis_data:/data

volumes:
  docmost:
  db_data:
  redis_data:
```
For health check, a dedicated endpoint is available at YOUR_URL/api/health.

Replace the default configs
You are to replace the default environment variables in the docker-compose.yml file.

The APP_URL should be replaced with your chosen domain. E.g. https://example.com or https://docmost.example.com.

The APP_SECRET value must be replaced with a long random secret key (32 characters minimum).
You can generate the secret with openssl rand -hex 32. If you leave the default value, the app will fail to start.

Replace STRONG_DB_PASSWORD in the POSTGRES_PASSWORD environment variable with a secure password.

Update the DATABASE_URL default STRONG_DB_PASSWORD value with your chosen Postgres password.

To configure Emails or File storage driver, see the Configuration doc.
The default File storage driver is local storage. You don't have to do anything unless you wish to use S3 storage.

Start the Services
Make sure you are inside the docmost directory which contains the docker-compose.yml file.

To start the services, run:

```
docker compose up -d
```

Once the services are up and running, verify the installation by opening your web browser and navigating to: http://localhost:3000 or the domain that points to your server.

+ [Anleitung](https://docmost.com/docs/installation/)
