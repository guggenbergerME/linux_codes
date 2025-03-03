# Wert von Neg -> Pos

Aus einer negativen Zahl eine positive machen.

      |> map(fn: (r) => ({r with _value: r._value * -1.0 }))
