# Paperless installation
Installation von Paperless-ngx unter Ubuntu

## System update
```
sudo apt update

sudo apt upgrade
```

## Grundlegende Programme installieren
```
sudo apt install git build-essential gcc python3-dev python3-pip libsm6 libxrender1 libfontconfig1
```

## Paperless-ngx clonen
```
sudo git clone https://github.com/jonaswinkler/paperless-ng.git /opt/paperless-ng
```

## Install Paperless-ngx
```
cd /opt/paperless-ng

sudo pip3 install -r requirements.txt
```

## Configure Paperless-ngx
```
sudo cp contrib/env-sample .env
```
## Create Database Schema

Paperless-ngx requires a database to store its data. Firstly, update the database settings in the .env file. Then, run the following commands to create the schema:
```
sudo python3 manage.py makemigrations

sudo python3 manage.py migrate
```

## Create an Admin User

To log in to the Paperless-ngx web interface, you need to create an admin user account. Run the following command and enter the credentials as required:

```
sudo python3 manage.py createadmin
```

## Run the Server

Now that you have installed, configured and created an admin user, it's time to run the server. Use the following command:

```
sudo python3 manage.py runserver 0.0.0.0:8000
```
You should see the following output:
```
Starting development server at http://0.0.0.0:8000/ Quit the server with CONTROL-C.
```

### Quelle
+ [Tutorial](https://ipv6.rs/tutorial/Ubuntu_Server_Latest/Paperless-ngx/)
