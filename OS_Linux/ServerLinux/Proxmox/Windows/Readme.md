# Proxmox Windows installieren

## Downlad der benötigten Software
+ [virtio-win ISO](https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso)
+ [Windows 11](https://www.microsoft.com/ru-ru/software-download/windows11)

## Erstellen einer VM

+ OS Win11 ISO verwenden
+ System -> SCSI-Controller verwenden – VirtIO SCSI | Bios OVMF (UEFI) und TPM hinzufügen
+ Festplatte – VirtIO-Block und minimale Festplattengröße 64 GB

CD/DVD-Laufwerk zur Hardware hinzufügen, IDE virtio-win -Image verwenden. Jetzt können wir die VM starten und die Eingabetaste drücken, um zur VM-Konsole zu gelangen.
Wie gewohnt führen wir alle Schritte bis zum Datenträgerauswahlfenster durch.
Nächster Schritt: „ Laufwerk laden “. Wir suchen nach der virtio-win -CD . Ordner viostore > w11 > amd64 öffnen.
Wir fahren mit der üblichen Installation fort.
