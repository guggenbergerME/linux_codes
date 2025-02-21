# mqtt auslesen

```
# Configuration for telegraf agent
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
  token = "w7zle-0xstNDEo7HPsphUDb8y3HEtsiJ7vo8jNCAc1AnvkXpRKpZXv6fnogXtOgGipYVqEsfmpkqW2eWKtZWHQ=="
  organization = "GIMA"
  bucket = "mqtt"

[[inputs.mqtt_consumer]]
  servers = ["tcp://127.0.0.1:1883"]
  ## Topics that will be subscribed to.
  topics = [
    "Heizung/#",
    "Temperatur/#",
  ]
  # topic_tag = "topic"
  qos = 0
  username = "hitesh"
  password = "RO9UZ7wANCXzmy"
  #data_format = "influx"

  data_format = "value"
  data_type = "float"

[[inputs.mqtt_consumer.topic_parsing]]
    topic = "Heizung/#"
    measurement = "measurement/_"
    tags = "tag/_"
    fields = "_/test"
    
    [inputs.mqtt_consumer.topic_parsing.types]
     test = "int"
``
