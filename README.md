Build and test

# Considering you just have cloned this repository, you have to follow those steps to get the 'PayMyBuddy' application and private Docker registry  ready :

1- Change directory and build the api container image :
   - cd ./mini-projet-docker
   - docker build -t buddy_app:v4 .
   - docker images 
![image](https://github.com/user-attachments/assets/f592a34e-5edb-4871-9414-6ad2e4e65a6f)


2- Create and set Db User login
    - create a .env file (vi .env), add this following lines and change "your_value", to put yours private login.
    
![image](https://github.com/user-attachments/assets/1b70ab88-71d8-4ef3-b14a-6f15eaf2a9ab)
   - execute this following commandes to set env values :
           set -a                                            # Exporte automatiquement les variables
	   . ./.env                                          # Charge le fichier .env
	   set +a                                            # Désactive l'export automatique
  	   envsubst < create_tmp.sql > ./initdb/create.sql   # Remplace les placeholders {{MYSQL_USER}} et {{MYSQL_PASSWORD}}
 

3- Run the application :
   As we've already created the application image, now you just have to run :

   - docker compose up -d
   - docker ps 
![image](https://github.com/user-attachments/assets/7a647eb9-6f93-40d4-b3fb-e7abdee11bc0)

   
4 - Test application    
    on browser type: ip_add:8080 , create an account and enjoy the application
    
 ![page de login](https://github.com/user-attachments/assets/93cec4a6-171c-427f-a6d2-4eb08a10d206)


![page accueil](https://github.com/user-attachments/assets/ea8d1e98-9d8f-448a-a7fd-4e930c5fab44)


5- Create a registry and its frontend
    I used registry:2 image for the registry, and joxit/docker-registry-ui:static for its frontend gui and passed some environment variables

   - docker compose -f docker-compose-registry.yml up -d
   - docker ps
![image](https://github.com/user-attachments/assets/8a6211d0-0c67-45f6-b425-0732ddd8bc8e)


   - on browser type: ip_add:8081
   
    E.g we'll be able to delete images from the registry via the gui.
  	
   NB : use login bikel / toto

   
![connexion doker registry](https://github.com/user-attachments/assets/eb8d9332-9fc4-42fd-8a91-b06c09b967e9)


6- Push an image on the registry and test the gui
  
   - docker login localhost:5000
   - docker tag buddy_app:v4 localhost:5000/buddy_app:local
   - docker image push localhost:5000/buddy_app:local


  reload the browser to see the pushed image  
  
  ![registry 2](https://github.com/user-attachments/assets/3c9131e1-bd83-4a2d-b131-9984d0e509da)

  
 Thanks
