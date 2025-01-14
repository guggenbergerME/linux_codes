# telegraf modbus

## Portverbindung testen

Prüfen der ob der Port offen ist
```
telnet [IP] [PORT]
```
telnet beenden ```STRG+AltGr+9```

## Protokollbeschreibung

```
REGISTERNUMMER	REGISTERADRESSE HEX	TYP
1-9999	            0000 to 270E	       lesen-schreiben	Discrete Output Coils	DO
10001-19999	    0000 to 270E	      lesen	Discrete Input Contacts	DI
30001-39999	    0000 to 270E	      lesen	Analog Input Registers	AI
40001-49999	    0000 to 270E	      lesen-schreiben	Analog Output Holding Registers	AO
```

## input Beispiel

```
[[inputs.modbus]]
  ## Connection Configuration
  ##
  ## The module supports connections to PLCs via MODBUS/TCP or
  ## via serial line communication in binary (RTU) or readable (ASCII) encoding
  ##
  ## Device name
  name = "Device"

  ## Slave ID - addresses a MODBUS device on the bus
  ## Range: 0 - 255 [0 = broadcast; 248 - 255 = reserved]
  slave_id = 1

  ## Timeout for each request
  timeout = "1s"

  ## Maximum number of retries and the time to wait between retries
  ## when a slave-device is busy.
  # busy_retries = 0
  # busy_retries_wait = "100ms"

  # TCP - connect via Modbus/TCP
  controller = "tcp://localhost:502"

  ## Serial (RS485; RS232)
  # controller = "file:///dev/ttyUSB0"
  # baud_rate = 9600
  # data_bits = 8
  # parity = "N"
  # stop_bits = 1
  # transmission_mode = "RTU"


  ## Measurements
  ##

  ## Digital Variables, Discrete Inputs and Coils
  ## name    - the variable name
  ## address - variable address

  discrete_inputs = [
    { name = "Start",          address = [0]},
    { name = "Stop",           address = [1]},
    { name = "Reset",          address = [2]},
    { name = "EmergencyStop",  address = [3]},
  ]
  coils = [
    { name = "Motor1-Run",     address = [0]},
    { name = "Motor1-Jog",     address = [1]},
    { name = "Motor1-Stop",    address = [2]},
  ]

  ## Analog Variables, Input Registers and Holding Registers
  ## measurement - the (optional) measurement name, defaults to "modbus"
  ## name       - the variable name
  ## byte_order - the ordering of bytes
  ##  |---AB, ABCD   - Big Endian
  ##  |---BA, DCBA   - Little Endian
  ##  |---BADC       - Mid-Big Endian
  ##  |---CDAB       - Mid-Little Endian
  ## data_type  - INT16, UINT16, INT32, UINT32, INT64, UINT64, FLOAT32, FLOAT32-IEEE (the IEEE 754 binary representation)
  ## scale      - the final numeric variable representation
  ## address    - variable address

  holding_registers = [
    { name = "PowerFactor", byte_order = "AB",   data_type = "FLOAT32", scale=0.01,  address = [8]},
    { name = "Voltage",     byte_order = "AB",   data_type = "FLOAT32", scale=0.1,   address = [0]},
    { name = "Energy",      byte_order = "ABCD", data_type = "FLOAT32", scale=0.001, address = [5,6]},
    { name = "Current",     byte_order = "ABCD", data_type = "FLOAT32", scale=0.001, address = [1,2]},
    { name = "Frequency",   byte_order = "AB",   data_type = "FLOAT32", scale=0.1,   address = [7]},
    { name = "Power",       byte_order = "ABCD", data_type = "FLOAT32", scale=0.1,   address = [3,4]},
  ]
  input_registers = [
    { name = "TankLevel",   byte_order = "AB",   data_type = "INT16",   scale=1.0,     address = [0]},
    { name = "TankPH",      byte_order = "AB",   data_type = "INT16",   scale=1.0,     address = [1]},
    { name = "Pump1-Speed", byte_order = "ABCD", data_type = "INT32",   scale=1.0,     address = [3,4]},
  ]
```

## Ausgabe testen

```
telegraf --config /etc/telegraf/telegraf.conf --test --debug
```

### Links
+ [Modbus Beschreibung](https://ipc2u.de/artikel/wissenswertes/modbus-rtu-einfach-gemacht-mit-detaillierten-beschreibungen-und-beispielen/)
