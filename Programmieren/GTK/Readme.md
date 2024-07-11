# GTK

GTK+ ist für nahezu jede Plattform verfügbar. Es läuft auf allen unixoiden Systemen (Unix, GNU/Linux, BSD, Mac OS X), auf Windows und auf mobilen Geräten. 
Eine Portierung gestaltet sich äußerst leicht, da GTK+ seine Widgets selber zeichnet und somit nur grundlegende Zeichenoperationen angepasst werden müssen. 

Die Kehrseite ist, dass sich GTK+ auf einigen Plattformen fremd anfühlt, weil native Widgets nur nachgeahmt und nicht nativ gerendert werden.

Obwohl es in C umgesetzt wurde, ist die Bibliothek hochgradig objektorientiert und unterstützt andere Sprachparadigmen, weil von Anfang an ein Augenmerk 
auf die Realisierung verschiedenster Sprachanbindungen gelegt wurde. Es existiert eine Vielzahl von Bindings ([siehe Tabelle oder Sprachanbindung für GTK+](https://en.wikipedia.org/wiki/List_of_language_bindings_for_GTK+))

## Das erste Programm

Natürlich kann hier keine vollständige Einführung in GTK+ und die zahlreichen verwendeten Konzepte gegeben werden. Für das Erlernen von GTK+ sei das unten verlinkte Tutorial hervorgehoben.

**helloworld.c**

```
#include <gtk/gtk.h>

static void on_button_clicked (GtkWidget *widget, gpointer data)
{
  g_print ("Hello World\n");
}

int main (int argc, char *argv[])
{
  GtkWidget *window, *button;
 
  gtk_init (&argc, &argv);
  window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  g_signal_connect (window, "destroy", G_CALLBACK (gtk_main_quit), NULL);
  gtk_container_set_border_width (GTK_CONTAINER (window), 10);
  button = gtk_button_new_with_label ("Hello World");
  g_signal_connect (button, "clicked", G_CALLBACK (on_button_clicked), NULL);
  gtk_container_add (GTK_CONTAINER (window), button);
  gtk_widget_show_all (window);
  gtk_main ();

  return 0;
}
```

## Übersetzen

Der Compiler benötigt für GTK+ eine ganze Reihe von Optionen. Glücklicherweise lassen sich diese über pkg-config automatisch hinzufügen:
```
gcc -Wall -g helloworld.c -o helloworld `pkg-config --cflags --libs gtk+-3.0` 
```
bzw. für GTK+ 2.x:
```
gcc -Wall -g helloworld.c -o helloworld `pkg-config --cflags --libs gtk+-2.0` 
```

Kompiliertes Programm mit ```./``` ausführen


### Links
+ [GTK ubuntu](https://wiki.ubuntuusers.de/GTK%2B/Programmierung/)
