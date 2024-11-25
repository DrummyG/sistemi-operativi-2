#!/bin/bash

# Controllare se la variabile passata sia una delle opzioni per uname
if [[ "$1" = "a" || "$1" = "m" || "$1" = "n" || "$1" = "p" || "$1" = "r" || "$1" = "s" || "$1" = "v" ]]; then
    # Stampare l'utilizzo dell'opzione
    man uname | grep "\-$1"
else
    echo "input non valido"
fi