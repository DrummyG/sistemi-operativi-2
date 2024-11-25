#!/bin/bash

# Sostituire tutte le Raffaella con Antonella
sed 's/Raffaella/Antonella/g' rubrica.txt > rubrica_2.txt

# Eliminare le prime tre righe del file risultante
sed '1d; 2d; 3d' rubrica_2.txt > rubrica_3.txt