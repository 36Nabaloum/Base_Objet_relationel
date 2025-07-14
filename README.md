📘 Projet SQL Oracle – Modélisation Orientée Objet d’un Document Scientifique
🧠 Contexte
Ce projet s’inscrit dans le cadre d’un exercice avancé de conception de bases de données orientées objets avec Oracle SQL. L’objectif est de modéliser la structure complète d’un document scientifique (rapport, mémoire, article), incluant :

son entête,

son résumé,

son corps structuré en paragraphes,

ses figures et images intégrées,

ses références bibliographiques.

🛠 Technologies & SGBD
Oracle Database avec SQL Worksheet

Types objets (CREATE TYPE)

Tables d’objets (TABLE OF)

Requêtes avancées avec jointures sur types imbriqués

Concepts de modélisation hiérarchique, encapsulation et référentialité

📂 Structure modélisée
t_document: type principal représentant le document.

t_entete: titre, auteurs, mots-clés, date.

t_resume: liste des lignes de résumé incluant figures et paragraphes.

t_corps: paragraphes et sous-paragraphes avec contenu textuel et visuel.

t_bibliographie: références externes liées à d’autres auteurs/documents.

t_image, t_figures, t_ouvrages_ref, etc.

📌 Exemple de Requête :
sql
Copier
Modifier
-- Obtenir les documents ayant un mot-clé donné ou une référence à un auteur spécifique
SELECT d.nom
FROM documents d,
     TABLE(d.bibliographie.ref_ouvrages) r,
     TABLE(r.nom_auteur) a
WHERE a.nom_auteurs = 'Nom Auteur Recherché'
   OR d.entete.mots_cles = 'Mot Clé Recherché';
✅ Résultats attendus
Démonstration de maîtrise des types objets Oracle

Encapsulation complète d’un document avec des sous-objets

Requête d’agrégation sur des objets imbriqués

Insertion de données complexes via une seule requête INSERT

🔗 Accès au projet complet sur GitHub
👉 https://github.com/mon-compte/document-sgbdoo-sql (remplace avec ton vrai lien)

👨‍💻 Auteur
Emile NABALOUM
Spécialiste Systèmes d’Information – SQL, Power BI, Oracle
📧 emi.nabaloum@gmail.com
📍 Ouagadougou – Burkina Faso
