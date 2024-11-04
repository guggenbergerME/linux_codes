# ER605 Wireguard Konfiguration

## Aufspielen der Firmeware
Um einen ständigen WG Tunnel über den Switch zu erzeugen wird die FW ER605(UN) - V2-2,2 Bau 202303313 (Beta) benötigt. [[Download](https://github.com/guggenbergerME/linux_codes/blob/main/Programmieren/VPN-Router/tp-link/ER605/Wireguard/ER605v2_un_2.1.2_20230313(beta).zip)]


## Konfiguration des Switch

### Wireguard Server anlegen
Um per Peer auf die OPNsense zugreifen zu können, muss auf dem Router eine Wireguard Server angelegt werden.
```
Name         vpn_140_XXX
MTU          1420
Listen Port  WG Port auf der OPNsense

Private Key  wird von Router erzeugt
Public Key   wird von Router erzeugt

Local IP Adress
```


## Einbinden des Peer in die Opensense
