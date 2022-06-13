## Primeros pasos con Containers / Docker

### Instalar Docker

Si usamos una instancia basada en CentOS:  

```bash
$ sudo yum install -y yum-utils

$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

$ sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin

```

Si usamos una instancia Basada en Amazon Linux

```bash
$ sudo yum install docker

## Instalar docker-compose y darle permisos de exec
$ sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/sbin/docker-compose

$ sudo chmod +x /usr/local/sbin/docker-compose

$ docker-compose -h
```

Luego habilitar e iniciar el servicio:

```bash
$ sudo systemctl enable docker
$ sudo systemctl start docker
```

### Primeros comandos

#### Crear containers

Para ejecutar y discutir:

```bash
$ sudo docker run hello-world

##Comando para descargar una imagen
$ sudo docker pull httpd:2.4 

```

#### Analizando containers

Ejecutar los siguientes comandos:

```bash
$ sudo docker run -d httpd:2.4

$ sudo docker ps #Obtener el id del container en ejecución
$ sudo docker inspect id_obtenido_del_container
$ sudo docker stop id_obtenido_del_container

#Listar imágenes
$ docker images

```
#### Ejecutando comandos en un container

Teniendo presente que un container es un proceso aislado de otros procesos, a menudo surgen necesidades tales como ejecutar un comando o script para que el proceso dentro del container pueda ejecutar correctamente. Tenemos dos formas de ejecutar un comando dentro de un container:

* Al momento de la creación del container 
* Luego de creado el container

```bash
## Al crear el container
$ sudo docker run -it ubuntu:latest /bin/bash
```
Observar que el comando ***docker run*** está acompañado de ***-it***, de esta forma le decimos que el container se ejecute en una shell interactiva y al final le pasamos el comando que queremos ejecutar, en este caso ***/bin/bash***. Esta combinación de comandos sirve para simular un entorno de shell tal como si iniciáramos sesión por ssh.

```bash
## luego de creado el container

#Debemos obtener el ID / nmombre del container
$ sudo docker ps 

#Usamos el parámetro exec
$ docker exec -it id_o_nombre_del_container /bin/bash
```
NOTA: podemos ejecutar cualquier comando / script que exista en la imagen del container.

#### Levantando nuestra primera aplicación

Vamos a crear un container con Apache, de nombre ***web_app1***, usando la imagen ***httpd*** y forwardeando el puerto 8080 de nuestro host al 80 del container.  

```bash
$ sudo docker run -d -p 8080:80 --name web_app1 httpd:2.4
```

Referencias:

* Con ***docker run*** le indicamos que vamos a crear un container
* Con ***-d*** le indicamos que el container corre de forma ***detached*** (en segundo plano)
* Con ***-p 8080:80*** le indicamos que mapee el puerto 8080 de nuestro host al 80 del container
* Con ***--name web_app1*** le indicamos el nombre del container
* Con ***httpd:2.4*** le indicamos imagen:tag a usar para el container, si la imagen no existe localmente, se descarga antes de iniciar el container
  
Para Windows y MacOS existe un proyecto llamado ***Docker Desktop*** que instala un ambiente gráfico para gestionar los containers con Docker. Mas info [acá](https://docs.docker.com/docker-for-windows/install/)
