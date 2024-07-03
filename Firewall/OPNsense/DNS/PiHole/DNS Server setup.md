# PiHole als DNS Server

This is how I setup my DNS environment with pihole and OPNsense. With this I achieved the following:

+ Clients are exlusively referred to pihole as DNS server
+ pihole acts as adblocker with logs, simple whitelisting and statistics
+ pihole acts as recursive DNS server
+ internal name resolution works as well

Some additional remarks:

+ DNS changes often only apply if you disconnect and then re-connect a client.
+ Sometimes a reboot of pihole instance might be helpful.

## Example: Network Setup
```
    LAN:     10.10.1.0/24    - local_lan.domain
    LAN2:   10.10.10.0/24  - local_lan2.domain
    sense:  10.10.1.1
    pihole:  10.10.1.254
```

## PiHole installation
Check here for details: https://docs.pi-hole.net/main/basic-install/
```
curl -sSL https://install.pi-hole.net | bash
```

## Prepare pi-hole as recursive DNS server

Check here for details: https://docs.pi-hole.net/guides/dns/unbound/

```
apt install unbound
```
```
nano -w /etc/unbound/unbound.conf.d/pi-hole.conf
```

Add the following text to pi-hole.conf (edit the end according to your networks): 
```
server: 

    # If no logfile is specified, syslog is used
    # logfile: "/var/log/unbound/unbound.log"
    verbosity: 0

    interface: 127.0.0.1
    port: 5335
    do-ip4: yes
    do-udp: yes
    do-tcp: yes

    # May be set to yes if you have IPv6 connectivity
    do-ip6: no

    # You want to leave this to no unless you have *native* IPv6. With 6to4 and
    # Terredo tunnels your web browser should favor IPv4 for the same reasons
    prefer-ip6: no

    # Use this only when you downloaded the list of primary root servers!
    # If you use the default dns-root-data package, unbound will find it automatically
    #root-hints: "/var/lib/unbound/root.hints"

    # Trust glue only if it is within the server's authority
    harden-glue: yes

    # Require DNSSEC data for trust-anchored zones, if such data is absent, the zone becomes BOGUS
    harden-dnssec-stripped: yes

    # Don't use Capitalization randomization as it known to cause DNSSEC issues sometimes
    # see https://discourse.pi-hole.net/t/unbound-stubby-or-dnscrypt-proxy/9378 for further details
    use-caps-for-id: no

    # Reduce EDNS reassembly buffer size.
    # Suggested by the unbound man page to reduce fragmentation reassembly problems
    edns-buffer-size: 1472

    # Perform prefetching of close to expired message cache entries
    # This only applies to domains that have been frequently queried
    prefetch: yes

    # One thread should be sufficient, can be increased on beefy machines. In reality for most users running on small networks or on a single machine, it should be unnecessary to seek performance enhancement by increasing num-threads above 1.
    num-threads: 1

    # Ensure kernel buffer is large enough to not lose messages in traffic spikes
    so-rcvbuf: 1m

    # Ensure privacy of local IP ranges
    private-address: 10.10.1.0/24
    private-address: 10.10.10.0/24
```

```
service unbound restart
```

Now let's test it:

```
dig pi-hole.net @127.0.0.1 -p 5335
```

==> Query should succeed. Takes longer first time. Less as of second time, because it's cached by pihole

```
dig sigfail.verteiltesysteme.net @127.0.0.1 -p 5335
```

==> Should output a SERVFAIL

```
dig sigok.verteiltesysteme.net @127.0.0.1 -p 5335
```

==> Should output NOERROR plus an IP address.

## pihole DNS Settings 

Edit only what is listed below and leave everything else empty:

+ Upstream DNS Server #1: 127.0.0.1#5335
+ Listen only on interface eth0 (or whatever is available as interface)
+ Check Never forward non-FQNs
+ Check Never forward reverse lookups
+ Check Use DNSSEC
+ Check Use conditional forwarding: 10.10.1.1/24 | 10.10.1.1 | local_lan.domain

and don't forget to save

## Enable Local Name Resolution
```
nano -w /etc/dnsmasq.d/02-custom.conf
```

And add the following text:
```
server=/local_lan2.domain/10.10.1.1
server=/local_lan.domain/10.10.1.1
server=/10.10.10.in-addr.arpa/10.10.1.1
server=/1.10.10.in-addr.arpa/10.10.1.1
```
These settings have to be seen in conjunction with Use Conditional Forwarding in pihole's DNS settings. Due to them pihole forwards all queries concerning local devices from itself to pfsense's Unbound DNS (10.10.1.1 in my example). All other requests are either forwarded to corresponding Root-Server or blocked, due to pihole's blacklists.


## OPNsense setup
```
Systems / Settings / General
```
Leave `DNS`empty (that's all  ;))
```
Services / DHCPv4 /  NETWORK
```
Add pihole IP - 10.10.1.254 as only DNS server and maintain static IP addresses as needed.
```
Services / Unbound DNS / General
```
Check Register DHCP leases and Register DHCP static mappings to enable local name resolution.

