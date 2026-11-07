# Règles de travail

## Branches

- `main` : version stable, utilisée pour les démos. On n'y pousse jamais directement.
- `dev` : branche d'intégration.
- Une branche par tâche, créée depuis `dev` : `feature/<numero-issue>-<nom-court>`
  (ex. `feature/4-import-bushland`), ou `fix/<numero-issue>-<nom-court>` pour une correction.

## Commits

Messages courts, au présent, qui disent ce que fait le commit :

```
feat: ajoute l'import des fichiers lysimètre
fix: corrige les dates de mesure décalées d'un jour
docs: complète le README du simulateur
```

Préfixes : `feat`, `fix`, `docs`, `refactor`, `test`, `chore`.
On ajoute `#<numero>` pour lier une issue : `feat: moteur de règles (#8)`.

## Pull requests

1. Pousser sa branche et ouvrir une PR vers `dev`.
2. Une autre personne du groupe relit et valide avant la fusion.
3. `dev` est fusionnée dans `main` avant chaque séance d'avancement.

## Données

Ne jamais commiter les fichiers de `data/raw/` (ils sont ignorés par `.gitignore`).
Ne jamais commiter de mot de passe ou de clé : utiliser un fichier `.env` (ignoré).
