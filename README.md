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


