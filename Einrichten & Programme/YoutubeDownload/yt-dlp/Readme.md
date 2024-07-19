# yt-dlp

## Installation Linux
```
sudo wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
```

## Beispiele

Download eines Videos - Eingabe erfolgt im Terminal!
```
$ yt-dlp https://www.youtube.com/watch?v=t5b20oLaIaw
```

Um ein Video oder eine Playlist mit einem benutzerdefinierten Namen herunterzuladen, verwenden Sie die -oFahne gefolgt vom gewünschten Namen. Zum Beispiel:

```
yt-dlp -o 'Abdul Kalam Wings of Fire Autobiography' https://www.youtube.com/watch?v't5b20oLaIaw
```

## Mehrere Videos im Parallelen herunterladen

Sie können mehrere Videos herunterladen, indem Sie ihre URLs im Befehl angeben, getrennt durch Leerzeichen wie so:
```
yt-dlp - URL1>
```
Verwenden einer Textdatei

Alternativ können Sie eine Textdatei mit allen Video-URLs erstellen, die Sie herunterladen möchten, und diese Datei dann als Argument an Youtube-dl weitergeben:

```
yt-dlp -a url.txt
```

## Herunterladen Nur Audio aus einem Video

Um ein Video als Audio herunterladen, d.h. Audio aus einem Video zu extrahieren, verwenden -xFlagge wie unten.
```
yt-dlp -x https://www.youtube.com/watch?v't5b20oLaIaw
```
Sie können auch das Ausgabe-Audioformat mit dem -x --audio-formatFahne.
```
yt-dlp -x --audio-Format mp3 https://www.youtube.com/watch?v't5b20oLaIaw
```


### Links
+ [Projekt](https://github.com/yt-dlp/yt-dlp#installation)
