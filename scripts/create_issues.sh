#!/usr/bin/env bash
# Crée les labels et les 12 issues du backlog S1 sur le repo GitHub courant.
# Prérequis : GitHub CLI installé et connecté (gh auth login), lancé depuis le dossier du repo.
set -euo pipefail

gh label create "priorite:haute"   --color d73a4a --force
gh label create "priorite:moyenne" --color fbca04 --force
gh label create "tache"            --color 0e8a16 --force
for l in donnees backend simulateur regles frontend rapport; do
  gh label create "$l" --color 1d76db --force
done

issue () { gh issue create --title "$1" --label "tache,$2,$3" --body "$4"; }

issue "Télécharger et explorer les jeux Bushland"            priorite:haute   donnees    "Format, variables disponibles, années, trous dans les données. Semaine S3."
issue "Choisir les années, cultures et champs utilisés"      priorite:haute   donnees    "Retenir 2–3 saisons et une culture pour le S1. Semaine S3."
issue "Créer le schéma PostgreSQL et les migrations"         priorite:haute   backend    "Tables exploitation, parcelle, capteur, mesure, recommandation, alerte, irrigation, rendement. Semaines S3–S4."
issue "Script d'import et de nettoyage des fichiers Bushland" priorite:haute  donnees    "Lire les xlsx, normaliser les unités et les dates, écrire dans data/processed/. Semaine S4."
issue "Simulateur de capteurs"                               priorite:haute   simulateur "Rejouer les mesures horodatées et les envoyer à l'API. Semaines S4–S5."
issue "API REST : exploitations, parcelles, capteurs, mesures" priorite:haute backend    "Endpoints CRUD + réception des mesures. Semaine S5."
issue "Intégration Open-Meteo (prévisions 48 h)"             priorite:moyenne backend    "Récupérer pluie et température prévues, avec cache local. Semaines S5–S6."
issue "Moteur de règles : recommandations + alertes"         priorite:haute   regles     "Irriguer / reporter / rien, alertes sol sec, forte chaleur, capteur suspect. Semaine S6."
issue "Tableau de bord : vue parcelles, jauges, courbes"     priorite:haute   frontend   "React + Tailwind + Recharts. Semaines S6–S8."
issue "Écran alertes et recommandations"                     priorite:moyenne frontend   "Liste, filtres, acquittement des alertes. Semaine S8."
issue "Tests, capteurs suspects et données manquantes"       priorite:moyenne backend    "Cas limites et tests de bout en bout. Semaine S9."
issue "Rapport final, présentation, démo"                    priorite:haute   rapport    "Livrables de fin de S1. Semaines S10–S11."

echo "Labels et issues créés."
