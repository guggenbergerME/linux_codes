# IPS konfigurieren

Mit Hilfe einer OPNsense-Firewall lassen sich neben der reinen Firewall-Funktionen auch zusätzliche Sicherheitsfeatures aktivieren, die man normalerweise nur in den großen Produktlinien der namhaften Firewall-Hersteller findet.

Dazu gehört auf jeden Fall auch das „Intrusion Detection and Prevention System“ (auch kurz IDS, IPS oder IDPS). Der Hauptunterschied zwischen IDS und IPS ist der Schutz: während das Intrusion Detection System nur auf die Erkennung von Angriffen und der Alarmierung beschränkt ist, kann ein Intrusion Prevention System bei der Erkennung vom Angriffen die Kommunikation aktiv verhindern.

Wenn man ein System als IPS betreiben möchte, muss es zwingend im Kommunikationspfad (beispielsweise auf Routing-Instanzen) integriert sein. Ein IDS dageben kann auch passiv im Netzwerk integriert sein. Dafür eignen sich entweder Mirror-Ports auf Switches oder Tap-Devices.

## Muster-Erkennung
Bei der Erkennung von Angriffen untersuchen die IDP-Systeme den Datenstrom auf Muster. Diese Muster können auf Angriffe auf Netzwerk-Ebene oder auf Anwendungsebene abzielen.

## Grundkonfiguration

Wir navigieren nun zu den Einstellungen für das IPS unter ``` Dienste > Einbruchserkennung > Verwaltung ```  .
