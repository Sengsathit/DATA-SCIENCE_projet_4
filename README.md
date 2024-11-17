![Segmentation des clients d'un site e-commerce](https://github.com/Sengsathit/OCR_data_scientist_assets/blob/main/header_olist.png?raw=true)

# PROJET : Segmentation des clients d'un site e-commerce

Nous considérons, pour ce projet, **Olist**, une entreprise brésilienne spécialisée dans les solutions de vente sur les marketplaces en ligne. Dans le cadre de son développement, **Olist** souhaite renforcer son équipe Data et met en place son premier projet majeur de Data Science : une segmentation des clients. Cette segmentation permettra aux équipes Marketing de mieux comprendre les profils des clients et d’adapter leurs campagnes de communication en conséquence.

## Objectifs

- Segmenter les clients en groupes homogènes basés sur leur comportement d'achat et leur satisfaction.
- Fournir une description exploitable de la segmentation pour les équipes Marketing, incluant des recommandations claires pour chaque segment.
- Évaluer la stabilité des segments dans le temps et proposer une fréquence de mise à jour du modèle.
- Respecter les conventions PEP8 pour garantir un code clair et réutilisable.

## Structure du dépôt

- `1_script.sql` : Fichier SQL contient des requêtes spécifiques pour répondre à des besoins métier précis.
- `2_notebook_exploration.ipynb` : Ce notebook est consacré à l'analyse exploratoire des données. L'objectif est de comprendre les caractéristiques des données brutes et d'identifier les tendances ou anomalies qui pourraient influencer les modèles ultérieurs.
- `3_notebook_essai.ipynb` : Ce notebook teste différentes approches de modélisation et d'algorithmes pour répondre à la problématique métier.
- `4_notebook_simulation.ipynb` : Ce notebook est dédié à l'analyse de la stabilité des modèles et à la simulation de scénarios futurs. Il vise à évaluer comment les segments ou les prédictions évoluent dans le temps et à proposer une fréquence de mise à jour.
- `requirements.txt` : Liste des dépendances Python nécessaires pour exécuter les notebooks.

---

## Prérequis

Pour exécuter ce projet, vous aurez besoin de Python (version 3.8 ou supérieure). Il est également recommandé d'utiliser un environnement virtuel pour isoler les dépendances du projet.

### Étapes pour créer et activer un environnement virtuel :

1. Créez un environnement virtuel :
   ```bash
   python -m venv .venv
   source .venv/bin/activate

2. Installez les dépendances :
   ```bash
   pip install -r requirements.txt
