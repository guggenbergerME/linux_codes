# Akeneo PIM Community Standard Edition

Creating a project and starting the PIM
The following steps will install Akeneo PIM in the current directory (must be empty) and launch it from there:

```
$ docker run -u www-data -v $(pwd):/srv/pim -w /srv/pim --rm akeneo/pim-php-dev:8.1 \
    php /usr/local/bin/composer create-project --prefer-dist \
    akeneo/pim-community-standard /srv/pim "dev-master@dev"
$ make
```

The PIM will be available on http://localhost:8080/, with admin/admin as default credentials.

To shutdown your PIM: 

```
make down
```
