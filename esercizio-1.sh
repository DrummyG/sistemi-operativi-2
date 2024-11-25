#!/bin/bash

# Controlla se è stato passato un indirizzo come argomento
if [ -z "$1" ]; then
    echo "Errore: specifica un indirizzo internet come argomento."
    exit 1
fi

# Scarica il sorgente della pagina, ignorando i messaggi di warning o errori
wget -q -O pagina_sorgente.html "$1" 2>/dev/null

# Controlla se il download è andato a buon fine
if [ $? -ne 0 ]; then
    echo "Errore durante il download della pagina."
    exit 1
fi

# Mostra il contenuto del file, indipendentemente dalla lunghezza
less pagina_sorgente.html

echo "Il sorgente della pagina è stato salvato in 'pagina_sorgente.html'."