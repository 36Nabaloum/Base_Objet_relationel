🧠 Projet SQL Oracle – Modélisation Orientée Objet d’un Document Scientifique

📋 Description du projet
Ce projet vise à créer une base de données orientée objet sous Oracle SQL pour la structuration complète d’un document scientifique, comme un rapport, un mémoire ou une thèse.
Il s’appuie sur les types objets et tables de collections pour modéliser les différentes composantes d’un document :

Entête (titre, auteurs, date, mots-clés)
Résumé structuré
Corps principal avec paragraphes et figures
Références bibliographiques
Insertion & interrogation de données

🛠️ Technologies utilisées
Oracle SQL (Types objets, TABLE OF, INSERT, SELECT)
SQL Worksheet / SQL Developer
SGBD : Oracle 21c+

🧱 Structure conceptuelle
graph TD;
  Document --> Entete
  Document --> Resume
  Document --> Corps
  Document --> Bibliographie
  Entete --> Auteurs
  Resume --> Lignes
  Corps --> Paragraphes
  Paragraphes --> Contenu
  Contenu --> Figures
  Figures --> Images
  Bibliographie --> Ouvrages

📂 Extrait du code
CREATE TYPE t_document AS OBJECT (
  type VARCHAR(50),
  nom VARCHAR(50),
  entete t_entete,
  resume t_resume,
  corps_doc t_corps,
  bibliographie t_bibliographie
);




> ⚠️ **Attention** : Ne laisse pas de texte ou saut de ligne entre les trois backticks (```) et le mot `sql`.

---

### ✅ 2. Ne pas mettre trop de lignes dans un seul bloc

Si ton script dépasse 100–150 lignes, sépare-le en plusieurs parties pour plus de lisibilité :
- Partie 1 : création des objets `auteur`, `entete`, `paragraphes`
- Partie 2 : insertion
- Partie 3 : requêtes d’extraction

---

### ✅ 3. Échapper certains caractères

Tu peux aussi avoir besoin d’échapper les chevrons (`<`, `>`) ou d’éviter certains caractères spéciaux dans des blocs si tu ajoutes HTML plus tard.

---

### ✅ Exemple propre et lisible dans un README

```sql
-- Création du type auteur
CREATE TYPE t_auteurs AS OBJECT (
    nom_auteurs VARCHAR(50),
    affiliation VARCHAR(50)
);

-- Suite d’auteurs
CREATE TYPE Suiteauteurs AS TABLE OF t_auteurs;

-- Création de l'entête
CREATE TYPE t_entete AS OBJECT (
    titre_ent VARCHAR(50), 
    auteurs Suiteauteurs, 
    mots_cles VARCHAR(50),
    date_creation DATE
);


📌 Requête d'exemple
SELECT d.nom
FROM documents d,
     TABLE(d.bibliographie.ref_ouvrages) r,
     TABLE(r.nom_auteur) a
WHERE a.nom_auteurs = 'Nom Auteur Recherché'
   OR d.entete.mots_cles = 'Mot Clé Recherché';


💡 Objectifs pédagogiques
Approfondir la modélisation orientée objet dans les SGBD
Démontrer la capacité à concevoir des systèmes hiérarchisés complexes
Exécuter des requêtes sur des types imbriqués et composés


👨‍💻 Auteur
Emile NABALOUM
Spécialiste des systèmes d'information, SQL & Power BI
📫 emi.nabaloum@gmail.com
📍 Ouagadougou, Burkina Faso


