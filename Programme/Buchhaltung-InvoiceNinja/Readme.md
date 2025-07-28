# Invoice Ninja

## Installation Docker

Github clone
    
    git clone https://github.com/invoiceninja/dockerfiles.git
    

## Generieren Sie einen APP_KEY
Dies APP_KEYkann durch Ausführen von Folgendem generiert werden:

If you haven't started the containers yet:

    docker run --rm -it invoiceninja/invoiceninja-debian php artisan key:generate --show

Or if your containers are already running:
    docker compose exec app php artisan key:generate --show

Ändern der .env

```
APP_URL=http://in.localhost:8003/
APP_KEY=<insert your generated key in here>
APP_DEBUG=true
REQUIRE_HTTPS=false
IN_USER_EMAIL=
IN_PASSWORD=
```


### Links
+ [Anleitung Github](https://github.com/invoiceninja/dockerfiles)
+ [Video](https://www.youtube.com/watch?v=xo6a3KtLC2g)
