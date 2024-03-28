## como montar una imagen y contenedor a partir de solo un dockerfile


1.- Construir la imagen:
Utiliza el comando docker build para construir la imagen a partir de tu Dockerfile. Por ejemplo:

docker build -t nombre_de_la_imagen .



2.- Ejecutar el contenedor (teniendo la imagen creada, crear el contenedor es muy rápido):
docker run -d -p 8888:8888 --name nombre_del_contenedor nombre_de_la_imagen


------------------
Obs: Al correr estos códigos y de acuerdo al dockerfile se crea una imagen con todo el contenido de la carpeta donde está el dockerfile. Además, existe un dockerignore, por lo que el contenido que se crea en una imagen omite todo lo que está en el docker ignore

Obs: Crear la imagen a partir del dockerfile toma tiempo, pero crear el container es muy rápido

Obs: 


-----------------------

In this example nombre_de_la_imagen le asigne:
analytics-env-ds

Y nombre del contenedor
version_2_analytics_env_local_cloud