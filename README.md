
# TP1

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

```yaml
FROM openjdk:7

COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac Main.java
CMD ["java", "Main"]
```

```bash
docker build -f ./DockerFile -t aladeen92i/java-backend:latest .
docker run -it --rm --name java-backend1 aladeen92i/java-backend:latest
```

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

```bash
maven api demo

docker build -f ./DockerFile -t aladeen92i/aladeendemo .
docker run -it --name javademo aladeen92i/aladeendemo 
```

https://imgur.com/a/jQpfgTq

### impossible d'accéder a la demo dans un navigateur, il manque l'option -p qui permet de forwarder le port exposé du conteneur à l'hôte


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

### controller :

le student controller  sert à créer/modifier/supprimer des étudiants, retourne aussi un student grace a son {id} ou une liste de student sur la racine /

le greeting controller permet de retourner un message avec le nom de l'utilisateur

le departement controller va retourner de listes d'etudiants, le nombre,  en fonction des departements, voir meme des departements

### dao : 

???? je ne fais pas de java habituellement je ne comprends pas.

### entity :

sert à déclarer les modèles de données/classes que l'on va manipuler

### service :

pour moi les services sont les fonctions que ls controlleurs vont appeler afin d'executer les actions

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

### Docker compose i used :

	docker-compose up 
	docker-compose down
	docker-compose ps

	docker rm $(docker ps -aq)
	docker rmi

#TP2

### Ok, what is it supposed to do ?

```bash
mvn clean verirfy
```

cette commande build et lance les test définis dans l'application

### What are Unit tests ? Integration test ?

Unit tests vont vérifier si les fonctions codées fonctionnent comme ce qu'on attend d'elles..

Integration test vont vérifier si ces les changements apportés ne sont pas dangereux pour le reste de l'application.

### What is a db changelog job ?

Un db changelog job est fait pour maintenir les versions de la base de données 

### What are testcontainers?

TestContainers est une librairie Java qui va permettre de lancer des conteneurs à la volée afin de faire tourner les scripts de test puis ils seront détruits apres avoir produit leurs résultats


### Working CI with travis file.

```yaml
# .travis.yml
language: java

script: mvn clean verify
```

### Why do we need this branch ?

we don't want to push changes directly on master, we want to work on dev and then we'll merge to master if this passes all the test in the CI  

### Secured variables, why ?

pour protéger notre repo, nous devons être les seuls à connaitres ces identifiants

### Why do we need this ?

On a besoin des Dockerfile pour construire nos images 
