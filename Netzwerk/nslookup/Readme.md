# nslookup linux alterna

In this article, you will learn how to install the dig command and nslookup command on Linux. These commands are used for network troubleshooting and gathering information about domain names.

Dig, short for Domain Information Gopher, is a DNS lookup utility used for probing DNS servers and troubleshooting problems associated with DNS servers. Due to its ease of use, system administrators rely on the tool to troubleshoot DNS issues.

Nslookup is used for handling DNS lookups and displays crucial information such as MX records, and the IP address associated with a domain name.

Newer Linux system ship both dig and nslookup utilities by default. However, older Linux systems may not. The two come bundled inside the bind-utils package.

Let’s see how we can install DNS troubleshooting utilities in Linux.


## Manjaro (arch)
Installation
```
pacman -Sy dnsutils
```
To check the version of dig installed, run.
```
dig -v
```
## Using the dig command
dig command can be used to query a domain name and retrieve information as shown:
```
dig fossmint.com
```
