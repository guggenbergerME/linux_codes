# Grafana / influxdb Werte berechnen

Am Beispiel des Stroms und der Spannung wird die Leistung ermittelt

```
dbstromL1 = from(bucket: "Mittelspannung")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "modbus")
  |> filter(fn: (r) => r["_field"] == "StromL1")
  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)
  |> keep(columns: ["_value", "_time"])

dbSpannungL1L2 = from(bucket: "Mittelspannung")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "modbus")
  |> filter(fn: (r) => r["_field"] == "VoltageL1L2")
  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)
  |> keep(columns: ["_value", "_time"])

join1 = join(tables: {dbstromL1: dbstromL1, dbSpannungL1L2: dbSpannungL1L2}, on: ["_time"])
  |> fill(column: "_value_dbstromL1", usePrevious: true)
  |> fill(column: "_value_dbSpannungL1L2", usePrevious: true)
  |> map(fn: (r) => ({_time: r._time, _dbstromL1: r._value_dbstromL1, _dbSpannungL1L2: r._value_dbSpannungL1L2}))
  |> keep(columns: ["_time", "_dbstromL1", "_dbSpannungL1L2"])

ACpower = join1
  |> map(fn: (r) => ({"_time": r._time, "DC-Power": r._dbstromL1 * r._dbSpannungL1L2 * 1.73}))
  |> yield()
```
