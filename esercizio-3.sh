#!/bin/bash

# Stampare un riepilogo del numero di persone raggruppate per ruolo
echo "Conteggio per ruolo:"
awk '{print $1}' rubrica.txt | sort | uniq -c

# Stampare tutte le persone che non hanno come ruolo Ricercatore
echo -e "Persone che non hanno il ruolo di Ricercatore:\n"
awk '$1 != "Ricercatore"' rubrica.txt

# Inserire in un file italia.txt le righe con e-mail che terminano con .it
grep '\.it$' rubrica.txt > italia.txt