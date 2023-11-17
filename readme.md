### README pour l'Installation du Service PDF+CHAT

#### Introduction
Ce guide fournit des instructions détaillées pour l'installation et la configuration du service `PDF+CHAT`, une application basée sur l'API OpenAI pour interagir avec des fichiers PDF.

#### Prérequis
- Un serveur sous Linux avec accès root.
- Connexion Internet active.
- Une clé API OpenAI.

#### Étapes d'Installation

1. **Téléchargement du Script d'Installation**
   - Téléchargez le script `install.sh` depuis le dépôt GitHub ou copiez-le depuis une source fiable.

2. **Rendre le Script Exécutable**
   - Dans votre terminal, naviguez jusqu'au dossier contenant `install.sh`.
   - Rendez le script exécutable avec la commande :
     ```
     chmod +x install.sh
     ```

3. **Exécution du Script d'Installation**
   - Exécutez le script en tant que superutilisateur :
     ```
     sudo ./install.sh
     ```
   - Pendant l'exécution, le script vous demandera d'entrer votre clé API OpenAI. Veuillez la fournir lorsque demandé.

4. **Vérification de l'Installation**
   - Après l'installation, le script démarrera automatiquement le service `PDF+CHAT`.
   - Vous pouvez vérifier l'état du service avec :
     ```
     systemctl status ask-multiple-pdfs.service
     ```

#### Accéder au Service
- Une fois l'installation terminée, le service `PDF+CHAT` est accessible via un navigateur web à l'adresse suivante : [http://localhost:8501](http://localhost:8501).

#### Configuration Avancée
- Pour des configurations avancées, comme changer le port ou l'adresse d'hébergement, modifiez les paramètres dans le script d'installation ou directement dans les fichiers de configuration de l'application.

#### Dépannage
- En cas de problèmes, consultez les journaux du service via :
  ```
  journalctl -u ask-multiple-pdfs.service
  ```
- Assurez-vous que toutes les dépendances sont correctement installées et que le script a été exécuté avec les privilèges root.

#### Support et Contributions
- Pour toute assistance supplémentaire, veuillez ouvrir une issue sur le dépôt GitHub du projet.
- Les contributions au projet sont les bienvenues et peuvent être soumises sous forme de Pull Requests sur GitHub.
