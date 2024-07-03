# HAProxy
## Installation und Konfiguration des HAProxy-Plugins

Der Reverse-Proxy mit Namen HAProxy muss zunächst installiert werden:
```
System / Firmware / Plugins / os-haproxy → Install
```
Anschließend muss der HAProxy aktiviert werden:
```
Services / HAProxy / Settings / Service Settings
```
** Haken bei: Enable HAProxy **

## Einrichtung virtueller IPs und zugehöriger Namen (Aliases) für den HAProxy

Um zwischen Anfragen an den HAProxy unterscheiden zu können, die ausschließlich von intern (lan) oder von intern und extern (lan_wan) zulässig sind, werden zwei virtuelle LAN-IP-Adressen benötigt, auf denen der HAProxy lauschen kann:

Firewall / Virtual IPs / Settings → Add

### Virtual IP (HAProxy-Interface für interne und externe Anfragen)

+ Mode: IP Alias
+ Interface: LAN_SERVER
+ Address: 10.1.100.2/32
+ Description: HAProxy_lan_wan

### Virtual IP (HAProxy-Interface ausschließlich für interne Anfragen)

+ Mode: IP Alias
+ Interface: LAN_SERVER
+ Address: 10.1.100.3/32
+ Description: HAProxy_lan

Zusätzlich werden für beide IP-Adressen Alias-Namen in OPNsense hinterlegt, auf die später zugegriffen wird: 

## Firewall / Aliases → Add

### Alias (HAProxy-Interface für interne und externe Anfragen)

+ Name: HAProxy_lan_wan
+ Type: Host(s)
+ Content: 10.1.100.2

### Alias (HAProxy-Interface ausschließlich für interne Anfragen)

+ Name: HAProxy_lan
+ Type: Host(s)
+ Content: 10.1.100.3

## Interne und externe Anfragen Webserveranfragen (Ports 80/443) auf den HAProxy weiterleiten
Sowohl externe als auch interne HTTP- und HTTPS-Anfragen sollen auf die entsprechenden HAProxy-Interfaces weitergeleitet werden. 

## Weiterleitung externer Anfragen

Firewall / NAT / Port Forward → Add

### Weiterleitung (auf Port 80)

+ Interface: WAN
+ TCP/IP Version: IPv4
+ Protocol: TCP
+ Destination: any
+ Destination port range: from: HTTP to: HTTP
+ Redirect target IP: HAProxy_lan_wan
+ Redirect target Port: http
+ Description: HAProxy_lan_wan

### Weiterleitung (auf Port 443)

+ Interface: WAN
+ TCP/IP Version: IPv4
+ Protocol: TCP
+ Destination: any
+ Destination port range: from: HTTPS to: HTTPS
+ Redirect target IP: HAProxy_lan_wan
+ Redirect target Port: https
+ Description: HAProxy_lan_wan

## Weiterleitung interner Anfragen

### Links
+ [Tutorial HAProxy auf OPNsense Firewall mit Let’s Encrypt](https://blog.we-cme.de/haproxy-auf-opnsense-als-https-frontend-mit-lets-encrypt/)
