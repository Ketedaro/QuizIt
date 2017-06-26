# QuizIt

Pour faire fonctionner notre application il faut:

  - Placer le dossier "QuizIT" sur le serveur tomcat dans le dossier "webapps"
  
  - Modifier le fichier de configuration à la base de données "WEB-INF/classes/config.txt" avec vos informatinos dans cette ordre:
	Ligne 1: le nom du driver à charger pour connecter la base de donnée et java (initialement c'est le driver pour MySQL)
	Ligne 2: l'adresse de la base de donnée sous le format suivant jdbc:TYPEDEBASE//URL:PORT/QuizIt 
	Ligne 3: le login pour la base de données
	Ligne 4: le mot de passe pour la base de données
 
  - Lancer le script SQL dans votre base de données.
  
  Les jeux de login / mots de passes :
  
        Admin:admin
        Andy:andy
        Kilian:kilian
        Victor:victor
        Lucas:lucas
        
  Seul le compte Admin a les droits admin et peut valider des questions soumises.
