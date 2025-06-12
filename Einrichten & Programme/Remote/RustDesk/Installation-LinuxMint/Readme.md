# RustDesk auf Linux Mint installieren

RustDesk ist eine Remote-Desktop-Software, mit der Sie sich von überall auf der Welt mit Ihren Remote-Computern verbinden und steuern können. In diesem Tutorial zeigen wir Ihnen, wie Sie RustDesk auf Linux Mint installieren.

## easy

```
wget https://github.com/rustdesk/rustdesk/releases/download/1.4.0/rustdesk-1.4.0-x86_64.deb
chmod +x rustdesk-1.4.0-x86_64.deb
apt install -fy ./rustdesk-1.4.0-x86_64.deb -y
rm rustdesk-1.4.0-x86_64.deb
```

## Download der RustDesk package

    wget https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init

## RustDesk installieren

Installscript  ```rustup-init```ausführbar machen.

    chmod +x rustup-init 

Installscript ausführen

    ./rustup-init -y 

## RustDesk starten

    rustdesk 

### Stichwörter
+ Rustdesk
+ Linux Mint
+ LinuxMint
+ Installation
