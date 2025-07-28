# Invoice Ninja

## Installation Docker

Github clone
    
    git clone https://github.com/invoiceninja/dockerfiles.git
    

API Key erzeugen

    openssl rand -base64 64

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
