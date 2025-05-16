# Bash FTP kopie

```
#!/bin/bash

# FTP-Zugangsdaten
FTP_HOST="ftp.beispielserver.de"
FTP_USER="dein_benutzername"
FTP_PASS="dein_passwort"
REMOTE_DIR="/zielverzeichnis"
LOCAL_FILES="/pfad/zu/deiner/datei.txt"  # Oder: "/pfad/*.txt" für mehrere Dateien

# FTP Upload
ftp -inv $FTP_HOST <<EOF
user $FTP_USER $FTP_PASS
cd $REMOTE_DIR
mput $LOCAL_FILES
bye
EOF
```

## Script Ausführbar machen
   
    chmod +x qr_dinA4_generator.sh
