# 📦 Olist:  Performance Supply & Livraison 

## 🎯 Objectif du projet
Ce projet vise à analyser la **performance logistique** et la **satisfaction client** sur la marketplace **Olist**, en exploitant un jeu de données e-commerce réel.  
L’objectif est de comprendre le parcours **“de la commande à la réception”**, d’identifier les leviers d’amélioration et d’intégrer des briques **d’intelligence artificielle (IA)** pour analyser automatiquement les avis clients.

---

## 🧩 Contexte business
Olist est une plateforme brésilienne reliant des milliers de vendeurs à des clients via une marketplace unique.  
La performance logistique et la satisfaction client sont des enjeux stratégiques :  

- Les **retards de livraison** impactent directement la **note moyenne des avis clients**.  
- Les **données textuelles des commentaires** contiennent des signaux précieux sur les causes d’insatisfaction.  

Le projet cherche donc à répondre à deux grandes questions :

1. **Quels sont les leviers majeurs pour améliorer la satisfaction client ?**
2. **Peut-on prédire et expliquer les retards ou les avis négatifs à l’aide de l’IA ?**

---

## 🧠 Objectifs analytiques

### 1. Analyse descriptive (Data Analyst)
- Étudier les délais entre les différentes étapes : commande → expédition → livraison.  
- Identifier les causes de retard (produit, vendeur, région, période).  
- Mesurer l’impact des retards sur la satisfaction client (notes et commentaires).  
- Visualiser la performance logistique dans un **dashboard Power BI interactif**.

### 2. Analyse prédictive et IA
- **Modèle #1 – Prédiction des retards de livraison**  
  → Classifier les commandes susceptibles d’être livrées en retard (Random Forest).  
- **Modèle #2 – Analyse automatique des sentiments**  
  → Détecter les émotions dans les commentaires clients à l’aide d’un modèle NLP pré-entraîné (DistilBERT).  

---

## 🧱 Données utilisées
Les données proviennent du **dataset public Olist** disponible sur Kaggle.  
Elles sont réparties en plusieurs tables reliées par `order_id` et `customer_id` :

| Fichier | Description |
|----------|-------------|
| `olist_orders_dataset.csv` | Détails des commandes (dates, statuts, délais estimés) |
| `olist_order_items_dataset.csv` | Articles commandés (produits, vendeurs, prix, transport) |
| `olist_customers_dataset.csv` | Informations clients (identifiants, localisation) |
| `olist_sellers_dataset.csv` | Données des vendeurs (localisation, ID) |
| `olist_order_reviews_dataset.csv` | Avis clients (note, commentaire, timestamp) |
| `olist_products_dataset.csv` | Caractéristiques des produits |
| `olist_order_payments_dataset.csv` | Méthodes et montants des paiements |
| `olist_geolocation_dataset.csv` | Coordonnées géographiques (lat/lon) |
| `product_category_name_translation.csv` | Traduction des catégories produits |

---

## 🧮 Méthodologie du projet

### 🩵 Étape 1 — Cadrage & exploration
- Lecture et compréhension des données.  
- Définition des KPI logistiques et satisfaction.  
- Vérification de la qualité et cohérence des données.

### 💽 Étape 2 — Préparation & fusion des datasets
- Nettoyage, jointures (`orders`, `order_items`, `sellers`, `customers`).  
- Création des variables : délais, retards, distance client–vendeur.  

### 📊 Étape 3 — Analyse descriptive
- Analyse des délais moyens par vendeur, produit et région.  
- Corrélation délai ↔ satisfaction (`review_score`).  
- Visualisations : histogrammes, heatmaps, cartes.  
- Dashboard Power BI :  
  - Page 1 : Supply & Livraison  
  - Page 2 : Satisfaction client  
  - Page 3 : Corrélations & recommandations  

### 🤖 Étape 4 — IA #1 : Prédiction du retard de livraison
- Variable cible : `late_delivery = 1 si délai réel > délai estimé`.  
- Variables explicatives : `freight_value`, `product_weight_g`, `distance`, `category`, `seller_state`, etc.  
- Modélisation : Random Forest, XGBoost.  
- Évaluation : précision, F1-score, AUC.  
- Interprétation : SHAP values (importance des facteurs).  

### 💬 Étape 5 — IA #2 : Analyse de sentiment des avis
- Nettoyage du texte (`review_comment_message`).  
- Application d’un modèle pré-entraîné.  
- Extraction de mots-clés.  
- Analyse croisée : sentiment ↔ catégorie produit ↔ retard.  
- Visualisation : nuage de mots, score moyen par catégorie.  

### 🧾 Étape 6 — Synthèse & recommandations
- Identification des principaux leviers de satisfaction.  
- Propositions d’actions : optimisation transport, communication proactive, amélioration des produits.  
- Présentation visuelle et orale (Demo Day style).

---

## 📈 Livrables finaux

| Type | Fichier / format | Description |
|------|-------------------|-------------|
| Notebook 1 | `01_Exploration_Olist.ipynb` | Exploration et compréhension des données |
| Notebook 2 | `02_Cleaning_Preparation.ipynb` | Nettoyage et jointures |
| Notebook 3 | `03_KPIs_Analyses.ipynb` | Calculs des indicateurs clés |
| Notebook 4 | `04_Prediction_Retards.ipynb` | Modèle de prédiction des retards |
| Notebook 5 | `05_Sentiment_Clients.csv | Analyse de sentiment des avis |
| Dashboard Power BI | `Olist_Performance.pbix` | Visualisation interactive |
| Rapport / slides | `Olist_Project_Presentation.pdf` | Résumé des résultats et recommandations |

---

## 🧰 Outils & technologies
- **Python** : Pandas, NumPy, Matplotlib, Seaborn
- **SQL** : SQL server 
- **Power BI** : visualisation interactive & storytelling  
- **Jupyter Notebook** : exploration et modélisation  
- **Git / GitHub** : versioning et documentation  

---

## 💡 Compétences démontrées
✅ Data cleaning & manipulation multi-tables  
✅ Calculs d’indicateurs logistiques & satisfaction  
✅ Création de dashboards interactifs  
✅ Machine Learning appliqué à la logistique  
✅ NLP appliqué à la satisfaction client  
✅ Storytelling data & restitution business  

---



