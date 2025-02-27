# Modbus Janitza


## Auslesen des holding registers

```
[agent]
  interval = "10s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "10s"
  flush_interval = "10s"
  flush_jitter = "10s"
  precision = ""
  hostname = ""
  omit_hostname = false

[[outputs.influxdb_v2]]
  urls = ["http://xx.xx.xx.xx:8086"]
  token = "-l5C8-=="
  organization = "GIMA"
  bucket = "testjanizza"


# Retrieve data from MODBUS slave devices
[[inputs.modbus]]
  ## Connection Configuration
  ##
  ## The plugin supports connections to PLCs via MODBUS/TCP, RTU over TCP, ASCII over TCP or
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
  controller = "tcp://10.20.10.134:502"



  ## Trace the connection to the modbus device
  # log_level = "trace"

  configuration_type = "register"

  ## Measurements

  ## Analog Variables, Input Registers and Holding Registers
  ## measurement - the (optional) measurement name, defaults to "modbus"
  ## name        - the variable name
  ## byte_order  - the ordering of bytes
  ##  |---AB, ABCD   - Big Endian
  ##  |---BA, DCBA   - Little Endian
  ##  |---BADC       - Mid-Big Endian
  ##  |---CDAB       - Mid-Little Endian
  ## data_type   - BIT (single bit of a register)
  ##               INT8L, INT8H, UINT8L, UINT8H (low and high byte variants)
  ##               INT16, UINT16, INT32, UINT32, INT64, UINT64,
  ##               FLOAT16-IEEE, FLOAT32-IEEE, FLOAT64-IEEE (IEEE 754 binary representation)
  ##               FIXED, UFIXED (fixed-point representation on input)
  ##               STRING (byte-sequence converted to string)
  ## bit         - (optional) bit of the register, ONLY valid for BIT type
  ## scale       - the final numeric variable representation
  ## address     - variable address

holding_registers = [
{ name = "voltage", byte_order = "ABCD", data_type = "FLOAT32-IEEE", scale=1.0, address = [19001, 19002]},
##{ name = "StromL1", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11006]},
   
]

```

## Auslesen der Janitza Integer

Datentyp ist bei Janitzza ```FLOAT32-IEEE```. Dieser Datentyp setzt aus den beiden Integer ```19001 & 19002``` den gemessenen Wert zusammen. 
Wichtig ist auch die Reihenfolge der Low und High Bits. Dieses wird durch ```byte_order = "ABCD"``` definiert.
