# IPS konfigurieren

Mit Hilfe einer OPNsense-Firewall lassen sich neben der reinen Firewall-Funktionen auch zusätzliche Sicherheitsfeatures aktivieren, die man normalerweise nur in den großen Produktlinien der namhaften Firewall-Hersteller findet.

Dazu gehört auf jeden Fall auch das „Intrusion Detection and Prevention System“ (auch kurz IDS, IPS oder IDPS). Der Hauptunterschied zwischen IDS und IPS ist der Schutz: während das Intrusion Detection System nur auf die Erkennung von Angriffen und der Alarmierung beschränkt ist, kann ein Intrusion Prevention System bei der Erkennung vom Angriffen die Kommunikation aktiv verhindern.

Wenn man ein System als IPS betreiben möchte, muss es zwingend im Kommunikationspfad (beispielsweise auf Routing-Instanzen) integriert sein. Ein IDS dageben kann auch passiv im Netzwerk integriert sein. Dafür eignen sich entweder Mirror-Ports auf Switches oder Tap-Devices.

## Muster-Erkennung
Bei der Erkennung von Angriffen untersuchen die IDP-Systeme den Datenstrom auf Muster. Diese Muster können auf Angriffe auf Netzwerk-Ebene oder auf Anwendungsebene abzielen.

## Grundkonfiguration

Wir navigieren nun zu den Einstellungen für das IPS unter ``` Dienste > Einbruchserkennung > Verwaltung ```.

Als erstes aktivieren wir den „Advanced Mode“ (Pkt. 1), um die erweiterten Optionen zu haben. Anschließend aktivieren wir den Dienst Suricata überhaupt (Pkt. 2). Zu Beginn des Artikels haben wir ja den Unterschied zwischen IDS und IPS beschrieben: soll die OPNsense den Traffic aktiv unterbrechen, dann müssen wir den „IPS mode“ aktivieren (Pkt. 3). Übrigens: das IPS Suricata wird auch von kommerziellen Security-Produkten wie FireEye eingesetzt.

Für den Fall, dass wir einen VLAN-Trunk an die OPNsense heranführen, müssen wir den „Promiscuouse mode“ aktivieren, da dann das zugrundeliegende physikalische Interface überwacht wird und die OPNsense auch die Pakete anfassen soll, die eigentlich nicht für das Interface gedacht sind (Pkt. 4).

Hinweis: es ist auch möglich, die VLAN-Interfaces zu überwachen. Die Möglichkeiten dazu sind abhängig von der Schnittstellen-Hardware und letztlich von den Treibern. Bei einigen Systemen führt das Überwachen von VLAN-Interfaces zum Verlust der Konnektivität.

Wenn wir die Alarme und Blocks des IPS verwerten wollen (Dashboards, Korrelationen, SIEM, SOAR), dann können wir die Daten per Syslog weiterleiten (z.B. an Graylog oder Splunk, Pkt.5).

Im Gegensatz zu einem normalen Paketfilter, dessen IP-Adressberechnungen rein nummerisch erfolgen, nimmt ein IPS eine große Menge an Mustern und vergleicht sie mit dem tatsächlichen Traffic. Die Software zum Abgleich kann unterschiedlich ressourcenhungrig und effizient gestalten werden. Wir haben bislang gute Erfahrungen mit dem „Pattern matcher“ Hyperscan gemacht (Pkt. 6).

Unter (Pkt. 7) legen wir fest, an welchen Interfaces ein IPS aktiviert werden soll. Es gibt Stimmen, die ein IPS am WAN-Interface für unnötig halten, wenn NAT durchgeführt wird. Wir konnten das bislang nicht nachvollziehen.

Anschließend wird unter „Home networks“ noch festgelegt, welche IPs im internen Netzwerk genutzt werden. Diese Information wird auch dynamisch in Mustern verwendet (Pkt. 8).

Zum Schluss einmal auf „Apply“ klicken, um die Einstellungen zu übernehmen und zu speichern (Pkt. 9). 

## Download der Rulesets

Mit den oben durchgeführten Einstellungen ist das IPS bereits aktiv, allerdings fehlen nun noch die Pattern („Muster“), mit denen das IPS die Angriffe erkennen soll. Diese sind in Rulesets angeordnet. Ein Ruleset enthält mehrere Rules, die auf Pattern basieren.

Grundsätzlich sucht man sich seine gewünschten Rulesets aus (Pkt. 1), klickt auf „enable selected“ (Pkt. 2) und dann auf „download & update rules“ (Pkt. 3).

Die Rulesets unterscheiden sich zum einen in kostenpflichtige und kostenlose Rulesets. Die „guten“ Patterns sind deshalb kostenpflichtig, weil sie kuratiert und aktuell gehalten werden, bspw. IP-Adressen, von denen Angriffe, Portscans oder Exploits aus gestartet wurden.

Die kostenlosen Rulesets dagegen enthalten zum einen allgemeine Muster, bereits bekannte Schwachstellen oder IP-Adressen-Listen, die bereits älter sind. In der Regel haben die kostenlosen Rulesets eine Verzögerung von 30 Tage. Wer damit leben kann, darf gerne zugreifen.

Die zweite Unterscheidung besteht im Inhalt der Rulesets. Sie sind entweder thematisch (IPs), Service-bezogen (SSH, FTP, HTTP) oder Anwendung-bezogen (OpenSSH-Server, WordPress, MariaDB).

Wir empfehlen dringend, nur die benötigten Rulesets zu aktivieren. Das schont den RAM, die CPU sowie die Performance. Wer also FTP und Telnet gar nicht mehr im Netzwerk verwendet, muss diese Rulesets gar nicht herunterladen. Diese Patterns müssen daher auch nicht mit Traffic abgeglichen werden, was der Performance zugute kommt.

Nachdem die Rulesets herunterladen wurden, erscheint das Download-Datum unter „last updated“ (Pkt. 1). Die nicht ausgewählten Rulesets führen zu einem das „x“ und weisen auch „not installed“ als Download-Datum aus (Pkt. 2).

## Automatisches Ruleset-Update

Unter dem Reiter „Zeitplan“ können wir konfigurieren, dass OPNsense regelmäßig Rulesets aktualisiert und dann aktiviert. Dies wird mit einem Cronjob erledigt. Wer Cronjobs bereits kennt, wird mit der Konfiguration keine Probleme haben.

Mit „enabled“ wird der Cronjob aktiviert. Die nächsten 5 Felder definiert, wann der Job ausgeführt werden soll. Im Beispiel wird der Job um 4 Uhr und 00 Minuten an jedem Tag in der Woche, an jedem Tag im Monat sowie in jedem Monat gestartet.

Einmal pro Tag reicht. Wer den Job dennoch um 5 Uhr und 19 Uhr starten möchte, schreibt in die zweite Zeile „5,19“.

## IPS-Logs anzeigen

Es wird nicht lange dauern und schon werden die bekannten IPs auf der Firewall vorbeischauen.

Unter dem Menüpunkt „Services“ > „Intrusion Detection“ > „Administration“ und dem Tab „Alerts“ finden wir alle Verbindungen, die das IPS geblockt hat.

Wer detailliertere Informationen zu den IPS-Blocks haben möchte, findet diese unter dem Menüpunkt „Services“ > „Intrusion Detection“ > „Log File“.


## Link
+ [weitere Beschreibung](https://www.du-consult.de/opnsense-ips-konfigurieren/)
