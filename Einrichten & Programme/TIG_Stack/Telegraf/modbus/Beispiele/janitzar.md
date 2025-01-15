# Janitza input

## UMG 96 RM

```
[agent]
  interval = "25s"
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
  urls = ["http://xx.xx.xx.xx:8086"]
  token = "xxxx"
  organization = "NAME"
  bucket = "Bucket"


[[inputs.modbus]]
  name = "UMG96RM_PV"

  slave_id = 1
  timeout = "1s"
  controller = "tcp://xx.xx.xx.xx:502"
  holding_registers = [
    { name = "Voltage L1-N", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11000]},
    { name = "Voltage L2-N", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11001]},
    { name = "Voltage L3-N", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11002]},
    { name = "Strom L1, byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11006]},


  ]

```
