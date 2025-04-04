# History
In der Bash history werden die zuletzt auf der Shell ausgeführten Kommandos gespeichert. Möchte man später ein Kommando erneut 
aufrufen, kann man beispielsweise über die Pfeiltasten oder mittels [Strg]-[r] (reverse-i-search) auf zuvor ausführte 
Kommandos (inkl. aller Optionen und Parameter zurückgreifen) oder das "!" verwenden.

    history

## Parameter
**Zahl**

Bestimmt die Anzahl der letzten Eingaben.

**Pfeiltasten**
Sehr einfach können über die Pfeiltasten [↑] und [↓] die zuletzt aufgerufenen Kommandos durchsucht und durch anschließendes Drücken der [Enter] Taste erneut ausgeführt werden.

**[Strg]-[r]**
Möchte man eine längeres Kommando schnell und effizient erneut ausführen, eignet sich [Strg]-[r] (reverse-i-search) sehr gut.

Nach Drücken von [Strg]-[r] erscheint auf der Konsole folgender Eingabepromt:

        (reverse-i-search)`':
Wenn man nun einzelne Zeichen tippt ("pst" in diesem Beispiel), wird die Bash History automatisch nach Kommandos durchsucht, welche diese Zeichenkette enthalten hat. Ist das richtige Kommando gefunden ("pstree -C age -h -t" in diesem Beispiel) kann ohne weitere Eingabe durch Drücken der [Enter]-Taste das Kommando erneut aufgerufen werden:

        (reverse-i-search)`pst': pstree -C age -h -t
        !
Hat man sich zuvor mittels history Kommando die Liste an ausgeführten Kommandos angezeigt, und möchte man ein bestimmtes Kommando (das 1793. Kommando in diesem Beispiel) erneut aufrufen, so ist dies durch Eingabe von "!" gefolgt von der Kommandonummer einfach möglich:

```
werner@lmde6:~$ !1793
ls -lah
total 240K
drwx------ 26 werner werner 4,0K Feb 27 12:58 .
drwxr-xr-x  3 root   root   4,0K Nov 22 08:21 ..
-rw-------  1 werner werner  34K Feb 27 10:57 .bash_history
-rw-r--r--  1 werner werner  220 Nov 22 08:21 .bash_logout
-rw-r--r--  1 werner werner 3,5K Feb 27 11:36 .bashrc
drwxr-xr-x 26 werner werner 4,0K Jän 30 12:57 .cache
[...]
```

## Bash history size ändern
Standardmäßig ist die Größe der Bash History limitiert:

```
werner@lmde6:~$ grep HIST .bashrc 
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
```

Um das Limit zu entfernen, setzen Sie die Variablen HISTSIZE und HISTFILESIZE mit einem Editior wie nano oder vim in ~/.bashrc auf "-1":

```
werner@lmde6:~$ vi .bashrc 
werner@lmde6:~$ grep HIST .bashrc 
HISTCONTROL=ignoreboth
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=-1
HISTFILESIZE=-1
```

Durch erneutes Ausführen des bashrc Skriptes werden die neuen Einstellungen bereits im aktuellen Shell-Fenster wirksam:

source ~/.bashrc
