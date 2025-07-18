# Festplatten löschen

    fdisk -l

um das richtige Gerät zu finden (normalerweise /dev/sdx)

    fdisk /dev/sdx

um die Festplatte zu bearbeiten

Wählen Sie d, um die vorhandene Partition zu löschen (möglicherweise müssen Sie dies mehrmals tun, bis keine Partition mehr vorhanden ist).

dann w, um die Löschung zu schreiben 
