#!/bin/bash

# Étape 1 : préparer les fichiers OSRM si besoin
make extract
make contract

# Étape 2 : lancer OSRM et FastAPI dans deux terminaux séparés
gnome-terminal -- bash -c "make serve; exec bash"
gnome-terminal -- bash -c "make api; exec bash"

echo "✅ Tout est lancé : OSRM sur le port 5000, API FastAPI sur 8000"
