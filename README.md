Build and test

# Considering you just have cloned this repository, you have to follow those steps to get the 'PayMyBuddy' application and private Docker registry  ready :

1- Change directory and build the api container image :
   - cd ./mini-projet-docker
   - docker build -t buddy_app:v4 .

2- Run the application :
   As we've already created the application image, now you just have to run :

   - docker-compose up -d
   
3 - Test application    
    on browser type: ip_add:8080 , create an account and enjoy the application
 
2- Create a registry and its frontend
    I used registry:2 image for the registry, and joxit/docker-registry-ui:static for its frontend gui and passed some environment variables

   - docker-compose -f docker-compose-registry.yml up -d
   - on browser type: ip_add:8081
   
    E.g we'll be able to delete images from the registry via the gui.
  
	
   NB : use login bikel / toto

3- Push an image on the registry and test the gui
  
   - docker login localhost:5000
   - docker tag buddy_app:v4 localhost:5000/buddy_app:local
   - docker image push localhost:5000/buddy_app:local


  reload the browser to see the pushed image  
  
  
 Thanks
