# IPsec

## IPSec

IPSec ist ein Standard, um lokale Netzwerke sicher über das Internet zu verbinden. Dabei legt IPSec so genannte Virtual Private Networks (VPN) an.

IPSec arbeitet dabei auf der IP-Ebene. Dies bedeutet, es werden keine Veränderungen (wie z.B. Verschlüsselungsmodule) in den verwendeten Programmen benötigt. Deshalb ist es auch mit allen TCP/IP basierten Netzwerkprogrammen kompatibel.

IPSec kann lokale Netze oder auch einzelne Clients mit privaten Netzwerkadressen über das Internet verbinden. Dazu werden die ursprünglichen IP-Pakete verschlüsselt und in neue Pakete eingepackt. Beim Empfänger werden die Pakete wieder ausgepackt, entschlüsselt, geprüft und weitergeleitet.

evor allerdings eine verschlüsselte Verbindung aufgebaut werden kann, müssen sich die beiden Verbindungspartner sicher sein, dass Ihr Gegenüber auch der ist, für den er sich ausgibt (Authentifizierung). Hierzu gibt es zwei Verfahren. Das eine wird Pre-Shared Key (PSK) oder auch Shared Secret genannt. Hierbei kennen beide Seiten ein gemeinsames Passwort. Bei dem anderen Verfahren wird die so genannte Public-Key Kryptographie eingesetzt.

## Public-Key Kryptographie

Public-Key Kryptographie basiert auf einem mathematischen Verfahren, bei dem ein Schlüsselpaar aus einem geheimen Schlüssel (Private Key) und einem dazugehörigen öffentlichen Schlüssel (Public Key) erzeugt wird. Mit dem Public Key verschlüsselte Nachrichten können nur mit dem dazugehörigen Private Key entschlüsselt werden. Hat jemand nur den Public Key, so kann er nur verschlüsseln, nicht aber entschlüsseln.

Daher können die Public Keys problemlos auf unsicheren Kanälen (z.B. per E-Mail) ausgetauscht werden.

Die einzige Gefahr besteht darin, dass ein Angreifer den Schlüssel vertauscht haben könnte (sog. Man-in-the-middle Angriff). Wenn Sie ganz sicher gehen wollen, können daher nach dem Schlüsselaustausch die Signaturen (auch Fingerprint genannt) der Schlüssel z.B. am Telefon verglichen werden.

## Zertifikate

Als Erweiterung zum Konzept von öffentlichen und privaten Schlüsseln gibt es Zertifikate. Dabei wird der öffentliche Schlüssel von einer Zertifizierungsstelle (engl. Certification Authority, abgekürzt CA), digital signiert. Das ermöglicht bei größeren Installationen, dass eine Gegenstelle anhand der digitalen Signatur feststellen kann, ob ein Schlüssel gültig ist, ohne dass der Schlüssel selbst vorher installiert wurde.

Für das Intra2net System bringt eine solche Zertifizierungsstelle normalerweise nur wenig Vorteile, dennoch setzt das Intra2net System konsequent den Zertifikatsstandard X.509 ein. Dieser Standard hat sich in der Praxis anstatt einfachen Public-/Private-Key-Paaren durchgesetzt.

Um die Bedienung zu vereinfachen, erzeugt das Intra2net System normalerweise selbstsignierte Zertifikate, bei denen der Inhaber (Subject genannt) auch gleichzeitig der Zertifikatsaussteller (Issuer) ist. Dadurch sind bei der Bedienung keine zusätzlichen Schritte für die Verwendung von Zertifikaten nötig. Selbstverständlich können aber auch externe Zertifizierungsstellen verwendet werden.

## IPSec Verbindungen

Ein IPSec Verbindungsaufbau geschieht mit dem Protokoll Internet Key Exchange (IKE) in zwei Phasen.

Phase 1: Zuerst wird eine gesicherte Verbindung (ISAKMP SA oder IKE SA genannt) aufgebaut. Diese Verbindung wird über UDP Port 500 aufgebaut. Erkennt das System, dass eine Seite hinter einem NAT-Router steht, wird auf UDP Port 4500 umgeschaltet. Es gibt zwei Modi für den Verbindungsaufbau: den Main Mode und den Aggressive Mode. Der Aggressive Mode beschleunigt den Verbindungsaufbau um einige Zehntelsekunden, kann aber leichter geknackt werden. Das Intra2net System unterstützt daher nur den sicheren Main Mode.

Phase 2: Die zuvor aufgebaute gesicherte Verbindung wird nun genutzt, um die eigentlichen Verbindungsdaten und Sitzungsschlüssel auszuhandeln (Quick Mode). Ist dies erfolgreich, wird eine sog. IPSec SA konfiguriert und kann dann genutzt werden, um verschlüsselt Daten zu übertragen.

Beide Phasen der Verbindung haben aus Sicherheitsgründen nur eine begrenzte Lebensdauer und werden daher regelmäßig aktualisiert.

Aus Sicherheitsgründen und um das Routing zu vereinfachen überprüft jede Seite der Verbindung, dass nur genau die Pakete durch die Verbindung kommen, die vorher konfiguriert wurden. Daher ist es wichtig, dass auf beiden Seiten identische Werte für Start- und Zielnetz eines Tunnels angegeben wurden.

Damit die Sicherheitsrichtlinien sehr eng konfiguriert werden können, ist es möglich, zwischen zwei Rechnern beliebig viele verschiedene IPSec Verbindungen aufzubauen.

## Algorithmen

Beide Seiten einigen sich beim Verbindungsaufbau über die für Verschlüsselung und Datensignierung zu verwendenden kryptographischen Algorithmen. Die Algorithmen sind für jede Phase separat einstellbar. Im Intra2net System können im Menü Dienste > VPN > Verschlüsselung Profile mit Algorithmen konfiguriert werden.

Eine Verschlüsselungsmethode besteht dabei aus je einem Algorithmus für Verschlüsselung, für Hashing (Signatur) und einer Diffie Hellman Gruppe für den Aufbau einer gesicherten Verbindung. Die meisten Algorithmen werden in verschiedenen Längen angeboten. Die Länge wird in Bit angegeben und der Algorithmus ist desto stärker, je mehr Bit verwendet werden. Allerdings steigt mit der Bitzahl auch der nötige Rechenaufwand.

Für beide Phasen wird nun eine Liste von möglichen Methoden hinterlegt. Diese Liste wird in der eingestellten Reihenfolge der Gegenstelle angeboten, die dann die oberste, von ihr auch unterstützte Methode verwendet.

Auch die Verwendung von Perfect Forward Secrecy (PFS) in Phase 2 wird im Intra2net System über die Verschlüsselungsprofile konfiguriert. Ist auf dem Intra2net System eine PFS-Gruppe vorgegeben, wird diese beim Verbindungsaufbau verwendet. Baut die Gegenseite die Verbindung auf, akzeptiert das Intra2net System die eingestellte und alle stärkeren Gruppen. Ist die PFS-Gruppe auf Keine gestellt, werden Verbindungen ohne PFS aufgebaut. Baut die Gegenseite die Verbindung auf, werden Verbindungen mit und ohne PFS akzeptiert.

Alle angebotenen Algorithmen bieten aus heutiger Sicht eine ausreichende Stärke. Nicht mehr empfohlene Algorithmen wie z.B. einfaches DES mit 64 Bit werden vom Intra2net System gar nicht erst angeboten. Allerdings wurden in letzter Zeit in der kryptographischen Forschung einige mögliche Schwachstellen von vor allem MD5 als auch SHA diskutiert. Wir empfehlen daher, so bald wie möglich auf eine der stärkeren SHA2-Varianten (256, 384 und 512 Bit) umzusteigen.

## Einschränkungen

Bei der Entwicklung von IPSec war Voraussetzung, dass keinerlei Information unverschlüsselt oder an nicht autorisierte Gegenstellen versendet werden darf. Leider bringt dies auch einige Einschränkungen in Verbindung mit dynamischen IP-Adressen mit sich:

Alle Informationen werden verschlüsselt übertragen, also auch die Kennung einer Station. Da bei dynamischen IPs weder anhand der IP-Adresse noch anhand der Kennung entschieden werden kann, welcher Schlüssel zur Entschlüsselung verwendet werden soll, müssen alle diese Gegenstellen denselben Schlüssel verwenden.

Zum Glück gilt diese Einschränkung nur für das Pre-Shared Key Verfahren; beim Einsatz von Public Key Verfahren kann jede Gegenstelle einen eigenen Schlüssel haben. Durch die Trennung von Public und Private Key ist dies möglich, ohne dass Daten gefährdet werden. Wir empfehlen daher, ausschließlich das Public Key Verfahren zu verwenden.

## Kompatibilität mit anderen IPSec-Gegenstellen

IPSec ist standardisiert und das Intra2net System kann grundsätzlich mit allen standardkonformen Gegenstellen Verbindungen aufbauen. Allerdings erlaubt der IPSec-Standard sehr viele Wahlmöglichkeiten und Optionen, die teilweise auf beiden Seiten identisch eingestellt oder implementiert sein müssen. Daher können wir eine Kompatibilität nicht generell garantieren.

Viele einfachere Geräte (z.B. kleine Router) unterstützen ausschließlich eine Authentifizierung mit Pre-Shared Keys. Wegen den im vorherigen Abschnitt beschriebenen Einschränkungen können wir dazu nur dann raten, wenn beide Seiten über feste IP-Adressen verfügen.

Sind keine festen IP-Adressen verfügbar, sollten Sie Router verwenden, die Public Key unterstützen. Die Konfiguration einiger dieser Router wird in den folgenden Kapiteln vorgestellt.





