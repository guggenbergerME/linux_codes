# Paperless Barcode erkennen

Die Ergänzung der Konfiguration ist in 10 Sekunden erledigt. Es müssen lediglich zwei Zeilen in die docker-compose.yml aufgenommen werden:

      PAPERLESS_CONSUMER_ENABLE_BARCODES: 1
      PAPERLESS_CONSUMER_ENABLE_ASN_BARCODE: 1

Einfügen im Abschnitt „environment:“ und auf die Einrückung achten!

Nun die Änderung übernehmen mit 

    sudo docker-compose up -d

erledigt.

Von nun an erkennt Paperless-ngx die Codes in Scans. Auch die ASN-Suchfunktion kann entsprechend genutzt werden:

## Barcode drucken
+ [https://app.avery-zweckform.com/](https://app.avery-zweckform.com/) (5 Blätter 0-119)
