# Zugriff auf die FW nur von bestimmten IP`s

## Kategorie anlegen

Anlegen der Kategorien
+ SYS Access Admin IP (IP von Admins)
+ SYS Admin Ziel IP (Ziel des Zugriffes)

## Aliase anlegen

Anlegen der Aliase
+ SYS_Admin_Access_IP (welche IPs?)
+ SYS_Admin_Ziel (bspl. Firewall)

## Regel für die Schnittstelle

+ Aktion - **blockieren**
+ Schnittstelle - auswählen
+ Richtung - **in**
+ TCP/IP - **4&6**
+ Protokoll - **TCP**
+ Quelle umkehren - **aktivieren**
+ Quelle - **SYS_Admin_Access_IP**
+ Ziel - **SYS_Admin_Ziel**
