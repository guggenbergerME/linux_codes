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

Damit schulhausinterne Aufrufe der Webdienste direkt beim Reverse-Proxy landen und nicht über das Internet geroutet werden, müssen entsprechende Nameserver-Weiterleitungen zur virtuellen IP-Adresse des gewünschten HAProxy-Moduls existieren. Sofern der Webdienst nur innerhalb des Schulhauses erreichbar sein soll, leiten Sie zur virtuellen IP von HAProxy_lan ansonsten zu HAProxy_lan_wan weiter.

Beispiel für den Webdienst Nextcloud, welcher auch von außen erreichbar sein soll: 

### Services / Unbound DNS / Overrides / Host Overrides → Add

+ Host: nextcloud
+ Domain: z. B. ihre-schule.de
+ Type: A or AAAA (IPv4 or IPv6 address)
+ IP: z. B. 10.1.100.2 (virtuelle IP von HAProxy_lan_wan)

## Einrichtung von Real Servers

Real Servers sind jene Dienste, welche hinter dem HAProxy erreicht werden sollen.

Richten Sie für jeden Ihrer Webdienste - unabhängig davon, ob dieser von außen erreichbar sein soll oder nicht - einen Real Server ein:

+ nextcloud.ihre-schule.de
+ collabora.ihre-schule.de
+ usermanagement.ihre-schule.de
+ selfservice.ihre-schule.de
+ fog.ihre-schule.de

Beispiel für den Webdienst nextcloud.ihre-schule.de:
```
Services / HAProxy / Settings / Real Servers → Add
```
+ Name: nextcloud_host
+ FQDN or IP: z. B. 10.1.100.8 (IP-Adresse Ihrer Nextcloud)
+ Port: 80
+ SSL: kein Haken
+ Verify SSL CA: kein Haken

## Einrichtung von Backend Pools

Mit einem Backend Pool können ein oder mehrere Real Server gebündelt werden. Auch wenn für jeden Webdienst jeweils nur einen Real Server (z. B. gibt es nur einen Nextcloud-Server) bereitgehalten wird, muss an dieser Stelle für jeden Dienst ein Backend Pool eingerichtet werden.

Beispiel für den Webdienst nextcloud.ihre-schule.de:
```
Services / HAProxy / Settings / Virtual Services / Backend Pools → Add
```
+ Name: nextcloud_backend
+ Servers: nextcloud_host

## Einrichtung der Public Services

Die Public Services des HAProxys sind die Anlaufstellen, die interne bzw. externe Anfragen entgegennehmen.

Für das Schulnetzkonzept werden 3 Public Services benötigt:

+ eines für interne und externe Anfragen über http,
+ eines für interne und externe Anfragen über https und
+ eines für ausschließlich interne Anfragen über https.

### Einrichtung des Public Service für interne und externe Anfragen über http
```
Services / HAProxy / Settings / Virtual Services / Public Services → Add
```
+ Name: http_lan_wan
+ Description: interne und externe http-Anfragen
+ Listen Addresses:
  + z. B. 10.1.100.2:80 (HAProxy_lan_wan)
  + z. B. 10.1.100.3:80 (HAProxy_lan)
+ Type: HTTP / HTTPS (SSL offloading)
+ Default Backend Pool: none
+ Enable SSL offloading: kein Haken
+ X-Forwarded-For header: Haken



    

### Links
+ [Tutorial HAProxy auf OPNsense Firewall mit Let’s Encrypt](https://blog.we-cme.de/haproxy-auf-opnsense-als-https-frontend-mit-lets-encrypt/)
