#!/bin/bash

# Acquisire il nome del file da tastiera
echo "Inserisci il nome del file:"
read nome_file

# Controllare se il file esiste
if [ -e "$nome_file" ]; then
    # Controllare se il file ha dimensione maggiore di zero
    if [ -s "$nome_file" ]; then
        # Mostrare il numero di linee, parole e byte
        linee=$(wc -l < "$nome_file")
        parole=$(wc -w < "$nome_file")
        bytes=$(wc -c < "$nome_file")
        
        echo "Il file '$nome_file' esiste ed ha:"
        echo "- Linee: $linee"
        echo "- Parole: $parole"
        echo "- Byte: $bytes"
        
        # Impostare i permessi a lettura ed esecuzione per tutti
        chmod a+rx "$nome_file"
        echo "Permessi impostati a lettura ed esecuzione per tutti."
    else
        # Se il file esiste ma ha dimensione zero, rimuoverlo
        echo "Il file '$nome_file' è vuoto e verrà rimosso."
        rm "$nome_file"
    fi
else
    # Se il file non esiste, aprirlo con gedit
    echo "Il file '$nome_file' non esiste. Viene creato con gedit."
    gedit "$nome_file" &
fi