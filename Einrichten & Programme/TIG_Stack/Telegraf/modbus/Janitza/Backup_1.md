# Backup

```
[agent]
  interval = "10s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "0s"
  flush_interval = "10s"
  flush_jitter = "0s"
  precision = ""
  hostname = ""
  omit_hostname = false

[[outputs.influxdb_v2]]
  urls = ["http://10.110.0.4:8086"]
  token = "ky3mKBkK3PKQyDhQg7QZ7XRPjqsC0wN_6JFM-l5C8-f6peH2huJxCTYomqJsvldagbuN31_cPZOcrpM7Yaxv_w=="
  organization = "GIMA"
  bucket = "Mittelspannung"


[[inputs.modbus]]
  name = "UMG96RM_PV"

  slave_id = 1
  timeout = "1s"
  controller = "tcp://10.150.0.50:502"


## { name = "Voltage L2-L3", byte_order = "AB", data_type = "FLOAT32", scale=1.0,  address = [19007]},
## { name = "Voltage L3-L1", byte_order = "AB", data_type = "FLOAT32", scale=1.0,  address = [19008]},

## { name = "Strom L1", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [19012]},
## { name = "Strom L2", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [19013]},
## { name = "Strom L3", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [19014]},

## { name = "Leistung W", byte_order = "AB", data_type = "FLOAT32", scale=1.0,  address = [19026]},
## { name = "Frequenz HZ", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [19050]},

### Funktionierend


## { name = "Voltage L1-L2", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11003]},
## { name = "Voltage L2-L3", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11004]},
## { name = "Voltage L3-L1", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11005]},

## { name = "Strom L1", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11006]},
## { name = "Strom L2", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11007]},
## { name = "Strom L3", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11008]},

## { name = "Leistung W", byte_order = "AB", data_type = "FLOAT32", scale=1.0,  address = [19026]},
## { name = "Frequenz HZ", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11117]},

  holding_registers = [
    { name = "StromL1", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11006]},
    { name = "StromL2", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11007]},
    { name = "StromL3", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11008]},
    
    { name = "VoltageL1L2", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11003]},
    { name = "VoltageL2L3", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11004]},
    { name = "VoltageL3L1", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11005]},   

    { name = "FrequenzHZ", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11117]},

    { name = "LeistungW", byte_order = "AB", data_type = "FLOAT32", scale=1.0,  address = [11010]}, 
  ]

```
