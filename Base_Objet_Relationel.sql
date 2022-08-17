********************************************************************************************************************
												Creation de l object document et la table corespondante
********************************************************************************************************************

CREATE TYPE t_document as OBJECT(
	type VARCHAR(50),
	nom VARCHAR(50),
	entete t_entete,
	resume t_resume,
	corps_doc t_corps,
	bibliographie t_bibliographie,
);
/

CREATE TABLE documents OF t_document(
type primary key,
);



*************************Creation de objet entete*****************

 CREATE TYPE t_entete as OBJECT(
	 titre_ent VARCHAR(50), 
	 auteurs Suiteauteurs, 
	 mots_cles VARCHAR(50),
	 date_creation date,
 );
 /


 CREATE TYPE t_auteurs as OBJECT(
	nom_auteurs VARCHAR(50),
	affiliation VARCHAR(50), 
 );
 /
CREATE TYPE Suiteauteurs AS TABLE OF t_auteurs ;
/






********************** Creation de objet resumer*******************************
 CREATE TYPE t_resume as OBJECT(
	  lignes_text Suitelignes,
 );
 /


 CREATE TYPE t_lignes as OBJECT(
	   l_bibliographie t_bibliographie,
	   l_paragraphes Suiteparagraphes,
	   l_figures Suitefigures,
 );
 /

 CREATE TYPE Suitelignes AS TABLE OF t_lignes ;
/






************************Creation de objet corps************************

 CREATE TYPE t_corps as OBJECT(
	paragraphes Suiteparagraphes,
 );
 /

 CREATE TYPE t_paragraphes as OBJECT(
	 numéro_par VARCHAR(50),
	 titre_par VARCHAR(50), 
	 contenu Suitecontenu,
 );
 /
CREATE TYPE Suiteparagraphes AS TABLE OF t_paragraphes ;
/



 CREATE TYPE t_contenu as OBJECT(
 	 texte_contenu t_figures
	 sous_paragraphe Suiteparagraphes,
 );
 /
 CREATE TYPE Suitecontenu AS TABLE OF t_contenu ;
/



 CREATE TYPE t_figures as OBJECT(
 	 numéro_fig VARCHAR(50),
 	 titre_fig VARCHAR(50),
 	 image t_image,
 	 légende VARCHAR(50),
 	 description VARCHAR(250),
	 sous_paragraphe Suiteparagraphes,
 );
 /
 CREATE TYPE Suitefigures AS TABLE OF t_figures ;
/


 CREATE TYPE t_image as OBJECT(
	image_type BLOB,
	type_image VARCHAR(50),
 );
 /


 


***************************Creation de objet bibliographie********************

 CREATE TYPE t_bibliographie as OBJECT(
	ref_ouvrages Suiteouvrages_ref,
 );
 /

 CREATE TYPE t_ouvrages_ref as OBJECT(
	nom_auteur Suiteauteurs, 
	titre_ouv VARCHAR(50),
	dates_par date, 
	lieu_parution VARCHAR(50),
	documents_ouv t_document, 
 );
 /
 CREATE TYPE Suiteouvrages_ref AS TABLE OF t_ouvrages_ref ;
/



***********************************************************************************************************************************************
													Insertion de donneés sur la table documents
************************************************************************************************************************************************
INSERT into documents VALUES (
'rapport','Rapport du Cours de SGBDOO',

t_entete(
'titre Cours',Suiteauteurs(t_auteurs('emile','Bureau de Statistique'),
						t_auteurs('Roland','Bureau de Informatique')),
,'cour mots cles',to_date('05/08/2022','dd/mm/yyyy')),

t_resume(Suitelignes( t_lignes(
t_bibliographie(Suiteouvrages_ref(
t_ouvrages_ref(Suiteauteurs(t_auteurs('emile','Bureau de Statistique'),
						t_auteurs('Roland','Bureau de Informatique')),
,'cour mots cles',to_date('05/08/2022','dd/mm/yyyy'),'titre ouvrage',to_date('05/08/2022','dd/mm/yyyy'),'bobo lieu parution')
)),
Suiteparagraphes(t_paragraphes('numero paragraphe','titre paragraphe',
Suitecontenu(t_contenu(Suitefigures(t_figures('numero figure','titre figure',t_image('desssin.jpg','dessin'),'legende','description',null)),null))),
Suitefigures(t_figures('numero figure','titre figure',t_image('desssin.jpg','dessin'),'legende','description',null))
))
)
),

t_corps(Suiteparagraphes(t_paragraphes('numero paragraphe','titre paragraphe',
Suitecontenu(t_contenu(Suitefigures(t_figures('numero figure','titre figure',t_image('desssin.jpg','dessin'),'legende','description',null)),null))),
Suitefigures(t_figures('numero figure','titre figure',t_image('desssin.jpg','dessin'),'legende','description',null))
)),

t_bibliographie(Suiteouvrages_ref(
t_ouvrages_ref(Suiteauteurs(t_auteurs('emile','Bureau de Statistique'),
						t_auteurs('Roland','Bureau de Informatique')),
,'cour mots cles',to_date('05/08/2022','dd/mm/yyyy'),'titre ouvrage',to_date('05/08/2022','dd/mm/yyyy'),'bobo lieu parution')
))

);



************************************************************************************************************************************************************************************
													requette sql worksheet
*************************************************************************************************************************************************************************************
♠♠♠liste des titres des documents qui contiennent une référence bibliographique à tel auteur 
(ou qui ont tel mot clé), 

SELECT d.nom from document d,TABLE(d.t_bibliographie)b,TABLE(b.t_Suiteauteurs)au,TABLE(d.t_entete)en 
where en.mots_cles='mots cles' || au.nom_auteurs='nom auteur';