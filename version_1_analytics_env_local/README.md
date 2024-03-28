
# analytics-environment-local-cloud
Repo with instructios to create a analytics enviroment to develop data science projects collaborative locally and cloud (Docker and GCP)


## Motivation
- Trabajo colaborativo de forma fácil
- Entornos completamente aislados y estables independiente el pc y si se trabaja local y cloud


## Objetivo
Poder tener un ambiente analítico estable y transversal de trabajo donde puedan trabajar en conjunto un equipo de data scientist y no existan problemas de dependencias en las versiones u otros problemas de compatibilidad que puedan al tener al trabajar cada uno en sus propios computadores. Para poder conseguir este objetivo se desarrolla un ambiente analítico utilizando Docker

Ventajas: 
- Al tener un ambiente analítico en una imagen de docker cada data scientist puede montar un ambiente completamente aislado en su computador y todos trabajar en un ambiente exactamente igual y luego si se quieren pasar datos, modelos, códigos no va a haber ningun problema de compatibilidad

- Además al ser una imagen de docker, es posible montarla en cloud y poder utilizar ese ambiente. Para este ejemplo se muestra cómo montarla en GCP utilizando el servicio de Compute Engine, así la imagen completamente escalable de acuerdo a las necesidades del proyecto

- Como es una imagen docker la dificultad y tiempo radica en crear una imagen con versiones estables de los diferentes packages pero es muy fácil de montar localmente tanto localmente como cloud


**ESTO PARA DESPUÉS PROBLEMENTE**
- Además se incluyen códigos interesantes para el trabajo de un data scientist utilizando GCP, como por ejemplo versionamiento de experimentos o envio de jobs de entrenamiento






## INSTRUCTIONS TO INSTALL ANALYTICS ENVIRONMENT IN YOUR LOCAL MACHINE

### 1. Get Personal Service Account to use the GCP services
Note that it is your personal service account and the access to the cloud services depending of the permissions given to your account

#### - Install gcloud command line application
Follow the instructions for [installing gcloud sdk](https://cloud.google.com/sdk/docs/install) in your laptop.

#### - Open console google
Search the program "Google Cloud SDK Shell" and open it

#### - Login in gcloud
Execute `gcloud auth application-default login` and follow the browser instructions.


#### - Add default gcloud credentials to the root of this project
Copy the credentials file to the root of this project, depending of your environent, that file could be in: 
- `C:\Users\<your user>\AppData\Roaming\gcloud\application_default_credentials.json` (Windows)
- `~/.config/gcloud/legacy_credentials/<YOUR GOOGLE USERNAME>/adc.json` (Unix - Legacy)
- `~/.config/gcloud/application_default_credentials.json`
- `~/.config/gcloud/legacy_credentials/<YOUR GOOGLE USERNAME>/adc.json`

Make sure the name of your credentials json file added to the root of this project is **application_default_credentials.json**

Advice: in windows to locate the folder "appdata" you can write `%%appdata%%`


### 2. Start Docker in your local machine
Run the following instrucctions to create the Container in Docker with the analytics Environment

#### - Make sure you have the right environment variables
In the file `.env`

#### Open a console and navigate into the localtion of the files
Open a console (for example windows powershell) and navigate into the location of the files (dockerfile, docker-compose, requirements, etc)
Ex:
cd d:
cd D:\github-mi-repo\analytics-environment-local-cloud

#### - Install docker container
Run the command in a console  to create the docker container with the analytics environment

`docker-compose up`

Obs: to me works good run only docker-compose up. But you can try running "docker-compose up --build" if you have problems
Obs2: note that running is command corresponding a running the file with the same name that contains the configuration of the docker application
**Obs3: It if the first time that you run the codes, internally docker create the image and then mounth the container.** Create the images take time, but already you have created the image, create the container is fast

#### - Start Docker in your local machine
Run the command in a console if the docker container is not running.

`docker-compose up`


You will see in your terminal the address of the jupyter lab environment. Click it or paste it in the browser to access to jupyter Lab. `http://127.0.0.1:8888/`




## INSTRUCTIONS TO RUN ANALYTICS ENVIRONMENT IN YOUR LOCAL MACHINE
After install the docker container, it is possible run the analytics enviroment to do the data science work. 

#### - Initialize docker container/app - analytics environment
- Go to menu docker desktop in the menu "containers/apps" and select "start" in the container built

- Then go the dropdown menu and you see the specific container with the analytics environment and you see an option `Open in browser`, if you click it you will open a localhost with jupyterlab and the repo where the image was built.

- And you environment is full available to use it



## IMPORTANT CONSIDERATIONS IN DOCKER ENVIRONMENT

- **It is neccesary copy/paste a series of files to create the analytics environment (dockerfile, dockercompose, dockerignore, requirements) and the docker analytics environment works only in the repo with this files are located and the container was created**. So, for each project that need a different repository it is necessary build the environment.

    - It is usefull because it helps to have a controllated environment for each project

    - An also, it should be a problem is the team have always worked with other environments for example anaconda where it is not necesary have this kind of files in the repository

    - It is important considering this to define a polytics of repositorys that will fit to the team

- In the file "docker-compose" it is possible generate the name of the "image" and the "container" but in the docker desktop the name of the app where the container is located is named according the name of the folder where the docker-compose are located



---------------------------


## INSTRUCTIONS TO INSTALL ANALYTICS ENVIRONMENT IN CLOUD - COMPUTE ENGINE - GCP

- Pasar del docker image local a subirse al artifact registry

- VER QUÉ pasa con el archivo docker-compose

- Al tener el docker en artifact registry elegir la opción de deploy en un compute engine
    - En la opción firewall elegir la opción de habilitar tráfico http y https
    - También es necesario habilitar los puertos en el servicio de GCP firewall-vpc



## INSTRUCTIONS TO RUN ANALYTICS ENVIRONMENT IN YOUR LOCAL MACHINE
---------------------------------




## INSTRUCTIONS TO CREATE A THE ANALYTICS ENVIRONMENT (DOCKER IMAGE)


Archivos que se necesitan para crear la imagen de docker:
- **requirements.txt** (packages que se van a instalar)

- **Dockerfile**: Un dockerfile es un archivo de texto que contiene una serie de instrucciones que Docker utiliza para crear una imagen Docker. Estas instrucciones incluyen comandos para configurar el entorno de ejecución dentro del contenedor, como la instalación de software, configuración de variables de entorno, copia de archivos y directorios, exposición de puertos, etc

- **docker-compose.yml**: Este archivo especifica la configuración de la aplicación, incluyendo qué contenedores se ejecutarán, qué imágenes se utilizaran, cómo se conectarán entre sí, etc

- **dockerignore**: similar a .gitigore en git. Indica a Docker qué archivos y directorios debe ignorar al construir una imagen Docker. Esto es útil para evitar que archivos innecesarios o sensibles se incluyan en la imagen, lo que puede reducir el tamaño de la imagen y mejorar la seguridad.

- **start_jupyter.sh**: TODO: probar si es necesario este archivo



## TEMAS IMPORTANTES FALTANTES - ESTO HABRÍA QUE HACERLO EN CADA REPO POR LO QUE ES UN CACHO

## TEMAS IMPORTANTES FALTANTES - PUEDO HACERLO CREANDO EL AMBIENTE UNA VEZ Y ELEGIR QUÉ REPO RECORRER
(MAYBE CREAR EL REPO EN EL ROOT DONDE ESTAN TODOS LOS REPO ADENTRO)

## TEMAS IMPORTANTES PARA CMPC - LA UBICACION DEL DOCKER EN QUE PARTICION CREA LAS IMAGENES
## TEMAS IMPORTANTES PARA CMPC - LA VERSION DEL DOCKER QUE TENGO INSTALADA - QUISE INSTALAR LA ULTIMA Y NO PUDE PORQUE NO ERA COMPATIBLE CON MI VERSION DE WINDOWS
## TEMAS IMPORTANTES PARA CMPC - LA VERSION DE DOCKER EN EL PC IMPORTA PARA ALGO?
## TEMAS IMPORTANTES PARA CMPC - COMO HACER QUE SE PUEDA PROGRAMAR UTILIZANDO NOTEBOOKS DESDE VISUAL STUDIO CODE - no me reconoce el ambiente del docker


-------------------------------

## EXTRA: QUÉ ES DOCKER, CÓMO FUNCIONA DOCKER

### Qué es Docker
Docker es una plataforma de virtualización de contenedores que permite empaquetar, distribuir y ejecutar aplicaciones de forma consistente y portátil, facilitando el desarrollo, la prueba y la implementación de software en diferentes entornos de manera rápida y eficiente

### Cómo funciona Docker - conceptos claves
Conceptos claves:
- **Imágenes de Docker**: una imagen de Docker es un paquete ligero y autónomo que incluye todo lo necesario para ejecutar una aplicación: el código, las bibliotecas, las herramientas del sistema, las configuraciones y cualquier otra cosa que se necesite para que la aplicación funcione Las imágenes son de solo lectura y se utilizan como plantillas para crear contenedores
- **Dockerfile**: Un dockerfile es un archivo de texto que contiene una serie de instrucciones que Docker utiliza para construir una imagen Docker. Estas instrucciones incluyen desde la base de la imagen que se va a utilizar hasta la configuración del entorno y la copia de archivos necesarios para la aplicación
- **Contenedors Docker**: Un contenedor Docker es una instancia en ejecución de una imagen Docker. Es una forma de empaquetar y distribuir aplicaciones junto con todas sus dependencias en un entorno aislado. Los contenedores comparten el kernel del sistema operativo subyacente y se ejecutan como procesos aislados, lo que los hace ligeros  portátiles

### Proceso general de trabajo con Docker:
- Se define una imagen Docker utilizando un Dockerfile
- Esta imagen se construye utilizando el comando docker build
- Una vez que la imagen está construida, se puede utilizar para crear y ejecutar contenedores utilizando el comando docker run
- Los contenedores en ejecución pueden comunicarse entre sí y con el mundo exterior a través de puertos expuestos y redes definidas en Docker

### Conceptos secundatios Docker
- **Docker Hub**: Es un registro de imágenes de Docker (en la nube) que permite a los desarrolladores compartir y distribuir sus imágenes de Docker. También es un repositorio donde se pueden encontrar imágenes de Docker públicas creadas por la comunidad, así como imágenes privadas para uso interno de equipo o empresas

- **Docker Hub / jupyter images**: es una imagen Docker que contiene el entorno necesario para ejecutar Jupyter Notebooks y Jupyerlab. Estas imágenes incluyen las dependencias necesarias para ejecutar bibliotecas y herramientas de Data Science


## DOCUMENTATION
Interest links:
- Juptyter lab in docker locally: https://medium.com/technology-hits/starting-with-python-jupyter-in-docker-7d3ead8940cb

- Jupyter lab in a google cloud engine: https://medium.com/@squarefish75/host-your-jupyter-lab-using-docker-on-a-google-cloud-virtual-machine-513c3e6ec5f8

- How to see a computer engine app in my browser: https://stackoverflow.com/questions/56362196/how-to-see-my-compute-engine-app-in-my-browser

- Tutorial GCP compute engine: https://cloud.google.com/python/docs/getting-started/getting-started-on-compute-engine?hl=es-419

- (extra, maybe is useful) Redes VPC: https://cloud.google.com/vpc/docs/vpc?hl=es-419#externalhttpconnection