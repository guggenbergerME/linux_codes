# Console hp procurve switch 2650

## Console Setup
+ Port S0
+ Baud 9600
+ Parity none
+ Bits 8
+ Stopbits 1
+ Flow Xon/Xoff

## Technische Daten
```
Authentication Method: 	     Secure Shell (SSH), RADIUS, TACACS+
Compliant Standards: 	       IEEE 802.3, IEEE 802.3u, IEEE 802.1D, IEEE 802.1Q, IEEE 802.3ab, IEEE 802.1p, IEEE 802.3x, IEEE 802.3ad (LACP), IEEE 802.1w, IEEE 802.1x
Device Type: 	               Switch - 48 ports - Managed - stackable
Enclosure Type: 	            Desktop 1U
Encryption Algorithm: 	      SSL
Features: 	                  Flow control, auto-sensing per device, auto-negotiation, BOOTP support, trunking, VLAN support, manageable, stackable
Flash Memory: 	              8 MB Flash
MAC Address Table Size: 	    8K entries
Ports: 	                     48 x 10/100 + 2 x combo Gigabit SFP
Processor: 	                 1 x Motorola MPC8245: 266 MHz
RAM: 	                       32 MB SDRAM
Remote Management Protocol: 	SNMP 1, RMON 1, RMON 2, RMON 3, RMON 9, Telnet, SNMP 3, SNMP 2c, HTTP
Routing Protocol: 	          IGMPv2, IGMP, IGMPv3
Subtype: 	                   Fast Ethernet
```

## Befehle
```
 boot                  Reboot the device.
 clear                 Clear table/statistics or authorized client public
                       keys.
 configure             Enter the Configuration context.
 copy                  Copy datafiles to/from the switch.
 debug                 Enable/disable debug logging.
 end                   Return to the Manager Exec context.
 erase                 Erase the configuration file stored in flash or the
                       primary/secondary flash image.
 getMIB                Retrieve and display the value of the MIB objects
                       specified.
 kill                  Kill other active console, telnet, or ssh sessions.
 log                   Display log events.
 page                  Toggle paging mode.
 print                 Execute a command and redirect its output to the device
                       channel for current session.
 redo                  Re-execute a command from history.
 reload                Warm reboot of the switch.
 repeat                Repeat execution of a previous command.
 setMIB                Set the value of a MIB object.
 setup                 Enter the 'Switch Setup' screen for basic switch
                       configuration.
telnet                Initiate an outbound telnet session to another network
                       device.
 terminal              Set the dimensions of the terminal window.
 update                Enter ROM update mode.
 walkMIB               Walk through all instances of the object specified
                       displaying the MIB object names, instances and values.
 write                 View or save the running configuration of the switch.

 enable                Enter the Manager Exec context.
 exit                  Return to the previous context or terminate current
                       console/telnet session if you are in the Operator
                       context level.
 link-test             Test the connection to a MAC address on the LAN.
 logout                Terminate this console/telnet session.
 menu                  Change console user interface to menu system.
 ping                  Send IP Ping requests to a device on the network.
 show                  Display switch operation information.
 traceroute            Send traceroute to a device on the network.
```
## Bedienung
```
SPACE      Auswahl treffen
```

### Tool
+ [GTKTerm](https://github.com/guggenbergerME/linux_codes/blob/main/Programmieren/RS232_seriell/GTKTerm.md)
