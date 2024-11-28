## Void callback -> Topic

Auswerten einer mqtt Topic Meldung

```
void callback(char* topic, byte* payload, unsigned int length) {

 Serial.print("Nachricht empfangen [");
  Serial.print(topic);
  Serial.print("]: ");
  
  // Payload in einen String umwandeln
  String message;
  for (int i = 0; i < length; i++) {
    message += (char)payload[i];
  }
  
  Serial.println(message);

  // Auswertung des Topics und der empfangenen Nachricht
  if (String(topic) == "TOPIC") {
    if (message == "AN") {
      Serial.println("Gerät einschalten");
      // Füge hier deinen Code zum Einschalten eines Geräts ein, z.B.:
      // digitalWrite(LED_BUILTIN, LOW);  // LED einschalten (LOW bei aktiver LOW-Logik)
    } 
    else if (message == "AUS") {
      Serial.println("Gerät ausschalten");
      // Füge hier deinen Code zum Ausschalten eines Geräts ein, z.B.:
      // digitalWrite(LED_BUILTIN, HIGH);  // LED ausschalten
    } 
    else {
      Serial.println("Unbekannter Befehl");
    }
  } else {
    Serial.println("Unbekanntes Topic");
  }

}
```
