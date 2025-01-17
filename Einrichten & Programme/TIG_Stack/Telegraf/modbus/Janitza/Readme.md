# Modbus Janitza


## Auslesen des holding registers

```
  holding_registers = [
    { name = "Voltage L1-N", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11000]},
    { name = "Voltage L2-N", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11001]},
    { name = "Voltage L3-N", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11002]},

    { name = "Strom L1", byte_order = "BA", data_type = "FLOAT32", scale=0.001,  address = [11006]},
    { name = "Strom L2", byte_order = "BA", data_type = "FLOAT32", scale=0.001,  address = [11007]},
    { name = "Strom L3", byte_order = "BA", data_type = "FLOAT32", scale=0.001,  address = [11008]},

    { name = "Leistung W", byte_order = "BA", data_type = "FLOAT32", scale=1.0,  address = [11021]},
    { name = "Frequenz HZ", byte_order = "AB", data_type = "FLOAT32", scale=0.1,  address = [11117]},
  ]

```
