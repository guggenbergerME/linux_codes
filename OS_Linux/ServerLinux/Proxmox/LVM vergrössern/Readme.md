# Speicherplatz auf LVM vergrößern

Ich habe eine virtuelle Maschine (VM) mit Ubuntu Server 22.04 LTS im Einsatz. Die Festplatte /dev/sda besteht aktuell auf drei Partitionen:

```
lsblk
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sda                         8:0    0   40G  0 disk
├─sda1                      8:1    0  953M  0 part /boot/efi
├─sda2                      8:2    0  1,8G  0 part /boot
└─sda3                      8:3    0 17,3G  0 part
  └─ubuntu--vg-ubuntu--lv 253:0    0 17,3G  0 lvm  /
```

Die Partition /dev/sda3 soll um vergrößert werden. Die Besonderheit ist, dass der Logical Volume Manager (LVM) eingesetzt wird. Nachstehend beschreibe ich die notwendige Schritte um die Partition zu vergrößern.

Auf dem Hypervisor (Proxmox, Hyper-V, VMware, etc) wird die Festplatte der virtuellen Maschine vergrößert. In meinem Fall um weitere 20GB.

Die neue Größe muss dem Betriebssystem bekannt gemacht werden. Dafür muss ein „Re-Scan“ durchgeführt werden.

```
echo 1 > /sys/class/block/sda/device/rescan
```

Die Vergrößerung der Partition /dev/sda3 kann mit Hilfe des Tools cfdisk durchgeführt werden.

```
cfdisk /dev/sda
```

+ [Details werden hier beschreiben](https://blog.daniel.wydler.eu/2024/02/25/speicherplatz-auf-lvm-vergroessern/)

Das bestehende Volume basierend auf dem LVM erweitern.
```
pvresize /dev/sda3
Physical volume "/dev/sda3" changed
1 physical volume(s) resized or updated / 0 physical volume(s) not resized
```

Das LVM Volume auf die maximal Größe erweiterten.
```
lvextend -l +100%FREE /dev/mapper/ubuntu--vg/ubuntu--lv
Size of logical volume ubuntu-vg/ubuntu-lv changed from 17,29 GiB (4427 extents) to 37,29 GiB (9547 extents).
Logical volume ubuntu-vg/ubuntu-lv successfully resized.
```

Abschließend muss das Dateisystem um den nun verfügbaren Speicherplatz erweitert werden.
```
resize2fs /dev/ubuntu-vg/ubuntu-lv
resize2fs 1.46.5 (30-Dec-2021)
Filesystem at /dev/ubuntu-vg/ubuntu-lv is mounted on /; on-line resizing required
old_desc_blocks = 3, new_desc_blocks = 5
The filesystem on /dev/ubuntu-vg/ubuntu-lv is now 9776128 (4k) blocks long.
```

Wie immer gilt natürlich zu prüfen, ob die Partition nun um 20 GB größer ist.

```
df -h
Filesystem                         Size  Used Avail Use% Mounted on
tmpfs                              391M  1,1M  390M   1% /run
/dev/mapper/ubuntu--vg-ubuntu--lv   37G   13G   23G  35% /
tmpfs                              2,0G     0  2,0G   0% /dev/shm
tmpfs                              5,0M     0  5,0M   0% /run/lock
/dev/sda2                          1,8G  253M  1,4G  16% /boot
/dev/sda1                          952M  6,1M  946M   1% /boot/efi
tmpfs                              391M     0  391M   0% /run/user/1000
```
