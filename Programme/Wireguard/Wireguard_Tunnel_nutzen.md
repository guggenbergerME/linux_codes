# Wireguard Tunnel

### Wireguard insallieren
```
sudo add-apt-repository PPA:wireguard/wireguard
```
```
sudo apt-get update
```
```
sudo apt-get install wireguard
```

Die Installation von wireguard-tools legt das Konfigurationsverzeichnis /etc/wireguard/ mit den zweckmäßigen Berechtigungen an. Kontrolle:
```
ls -ld /etc/wireguard/
```
mit der Ausgabe
```
drwx------ 2 root root 4096 Jun  4 07:56 /etc/wireguard/
```
Das Konfigurationsverzeichnis muss die hier gezeigten Berechtigungen und Besitzer haben!

Eine Installation von WireGuard aus einer Fremdquelle ist ab August 2020 bei Ubuntu nicht mehr erforderlich.
Der Start des Moduls wireguard.ko erfolgt automatisch beim Erstellen einer WireGuard-Schnittstelle. Es kann optional auch bereits beim Start des Kernels automatisch durch ein Eintragen in der Datei /etc/modules geladen werden:
```
echo "wireguard" | sudo tee -a /etc/modules 
```
Nach einem Neustart sollte das Modul geladen werden. Ohne Neustart kann das Modul auch manuell geladen werden:
```
sudo modprobe wireguard 
```
