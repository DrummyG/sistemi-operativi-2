#!/bin/bash

# Verificare se ci sono argomenti passati
if [ "$#" -eq 0 ]; then
    echo "Errore: nessun file o cartella specificato."
    exit 1
fi

# Definire la directory .Trash nella home dell'utente
trash_dir="$HOME/.Trash"
mkdir -p "$trash_dir"  # Creare la directory se non esiste

# Funzione per controllare la dimensione della directory .Trash e svuotarla se supera 100 KB
svuota_trash() {
    local size
    size=$(du -sb "$trash_dir" | awk '{print $1}')
    if [ "$size" -gt 102400 ]; then  # 100 KB = 102400 byte
        echo "La directory .Trash supera i 100 KB. Svuotamento in corso..."
        rm -rf "$trash_dir"/*
        echo "Directory .Trash svuotata."
    fi
}

# Itera su ciascun argomento passato
for item in "$@"; do
    if [ -e "$item" ]; then
        if file "$item" | grep -q "gzip compressed data"; then
            # Il file è già compresso, spostarlo direttamente
            echo "Il file '$item' è già compresso. Spostamento in .Trash..."
            mv "$item" "$trash_dir/"
        else
            # Comprimere il file e lo sposta in .Trash
            echo "Compressione del file '$item' e spostamento in .Trash..."
            gzip "$item" && mv "$item.gz" "$trash_dir/"
        fi
    else
        echo "Errore: il file o la cartella '$item' non esiste."
    fi
done

# Controllare la dimensione della .Trash e la svuota se necessario
svuota_trash
