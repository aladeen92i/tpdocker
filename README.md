lien gitlab : https://gitlab.com/becquart.quentin/tpdocker

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

docker pull postgres
docker pull adminer

create basic docker file for postgres, passing env args in the docker run command : 

	```yaml
	FROM postgres:11.6-alpine

	COPY 01-CreateScheme.sql /docker-entrypoint-initdb.d
	COPY 02-InsertData.sql /docker-entrypoint-initdb.d

	ENV POSTGRES_DB=db
	```


```bash
docker build -t aladeen92i/basicpostgres . 
docker run --name basicpostgres -v /postgres/data:/var/lib/postgresql/data -p 8000:8000 -e POSTGRES_USER=aladeen -e POSTGRES_PASSWORD=aladeen aladeen92i/basicpostgre:latest 
docker run --link 22a5ed757c71:db -p 8080:8080 adminer // is the name of my postgres container
```

result:
	https://imgur.com/a/yDtl7H2

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


docker pull openjdk

	FROM openjdk:7

	COPY . /usr/src/myapp
	WORKDIR /usr/src/myapp
	RUN javac Main.java
	CMD ["java", "Main"]

docker build -f ./DockerFile -t aladeen92i/java-backend:latest .
docker run -it --rm --name java-backend1 aladeen92i/java-backend:latest

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

maven api demo

docker build -f ./DockerFile -t aladeen92i/aladeendemo .
docker run -it --name javademo aladeen92i/aladeendemo 

https://imgur.com/a/jQpfgTq

impossible d'accéder a la demo dans un navigateur, il manque l'option -p qui permet de forwarder le port exposé du conteneur à l'hôte


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

controller :

le student controller  sert à créer/modifier/supprimer des étudiants, retourne aussi un student grace a son {id} ou une liste de student sur la racine /

le greeting controller permet de retourner un message avec le nom de l'utilisateur

le departement controller va retourner de listes d'etudiants, le nombre,  en fonction des departements, voir meme des departements

dao : 

???? je ne fais pas de java habituellement je ne comprends pas.

entity :

sert à déclarer les modèles de données/classes que l'on va manipuler

service :

pour moi les services sont les fonctions que ls controlleurs vont appeler afin d'executer les actions

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

Docker compose i used :

docker-compose up 
docker-compose down
docker-compose ps

docker rm $(docker ps -aq)
docker rmi
