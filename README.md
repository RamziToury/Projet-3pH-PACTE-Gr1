# Plateforme d'agriculture de précision

Projet 3pH PACTE – HESTIM, cycle ingénieur IIIA, 2026-2027.

Plateforme web qui collecte des données de capteurs et de météo, les affiche sur un tableau de bord et produit des recommandations d'irrigation et des alertes. Au Semestre 2, elle intégrera des modèles d'IA (prédiction du rendement, détection du stress hydrique).

## Données

La plateforme exploite les données réelles et publiques de la station de recherche irriguée **USDA-ARS de Bushland (Texas)**, publiées sur Ag Data Commons :

- [Weighing Lysimeter Data – Cotton](https://agdatacommons.nal.usda.gov/articles/dataset/Weighing_Lysimeter_Data_for_The_Bushland_Texas_Cotton_Datasets/25114670)
- [Weighing Lysimeter Data – Soybean](https://agdatacommons.nal.usda.gov/articles/dataset/Weighing_Lysimeter_Data_for_The_Bushland_Texas_Soybean_Datasets/24856557)
- [Weighing Lysimeter Data – Winter Wheat](https://agdatacommons.nal.usda.gov/articles/dataset/Weighing_Lysimeter_Data_for_The_Bushland_Texas_Winter_Wheat_Datasets/24856239)
- [Growth and Yield Data – Maize](https://agdatacommons.nal.usda.gov/articles/dataset/Growth_and_Yield_Data_for_the_Bushland_Texas_Maize_for_Grain_Datasets/24855909)

Les prévisions météo viennent de l'API gratuite [Open-Meteo](https://open-meteo.com).

Les fichiers bruts téléchargés vont dans `data/raw/` et ne sont **pas** versionnés (trop volumineux). Les données nettoyées vont dans `data/processed/`.

## Architecture

```
Données Bushland ──► Simulateur ──► API REST (FastAPI) ──► Tableau de bord (React)
                                        ▲
Open-Meteo ──► Moteur de règles ◄──► PostgreSQL
```

| Dossier | Contenu |
| --- | --- |
| `data/` | Données brutes (non versionnées) et nettoyées |
| `backend/` | API REST FastAPI, modèle de données, moteur de règles |
| `simulator/` | Rejeu des mesures Bushland comme un flux de capteurs |
| `frontend/` | Tableau de bord React + Tailwind CSS + Recharts |
| `docs/` | Rapports, backlog, schémas |
| `scripts/` | Scripts utilitaires (création des issues, import…) |

## Stack

Python + FastAPI · PostgreSQL · React + Tailwind CSS + Recharts · Docker Compose · scikit-learn (S2)

## Organisation

Voir [CONTRIBUTING.md](CONTRIBUTING.md) pour les branches, commits et pull requests, et [docs/backlog.md](docs/backlog.md) pour le planning.

## Équipe

-Hiba El Khiyari
-Hajar Cherrouk
-Ramzi Toury
-Soubane Moussa Mohamed-Amin 

