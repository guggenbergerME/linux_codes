# Borg Docker backup

## Schritt 1 - Daten zum Backup sammeln

Container speichern Daten an mehreren Stellen. Um ein komplettes Backup zu erhalten, müssen Sie feststellen, wo Daten gespeichert werden, um einen Container erfolgreich nachzubilden, aufbewahrt werden.

### Containerkonfiguration
Das bedeutet, dass die Details, die für die Neua Erstellung eines Behälters oder Pods benötigt werden, docker runBefehl, der benötigt wurde, um einen Container zu starten. Oft wird dies in einem docker-compose.ymlDatei (für kleine Einsätze), in einem Orchestrierungstool, wie Portainer oder einem anderen Bereitstellungsautomatisierungstool.
### Volumen
Alle Daten in einem Container werden vom Herausgeber des Bildes verwaltet und verschwinden, wenn der Behälter aktualisiert oder neu erstellt wird. So ist es notwendig, persistente Ordner außerhalb des Behälters zu montieren. Dies kann bei benannten Mengen passieren (nach der Containerlaufzeit verwaltet und in der Regel in /var/lib/docker/volumes/oder der Heimordner eines Benutzers) oder Bindenhalters (Links zu tatsächlichen Host-Ordnern). Egal, wo montierte Ordner gehalten werden, sie müssen in das Backup aufgenommen werden.
### Datenbanken
Viele Apps benötigen eine Datenbank zum Arbeiten und starten oft einen separaten Behälter dafür. Wenn Sie mehrere Apps haben, die z.B. eine MySQL-Datenbank benötigen, ist es im Allgemeinen einfacher, dies in einem Container zu konsolidieren und mehrere Apps einen DB-Container teilen zu lassen. Das erleichtert das Backup und spart auch Ressourcen.
