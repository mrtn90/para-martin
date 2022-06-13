## Construyendo imágenes

### Web simple HTML

Crear un Dockerfile para ensamblar una imagen con una aplicación web html.

#### Tareas

* Crear un documento html (se puede usar un generador html online)
* Crear un Dockerfile usando imagen base ***centos:centos7***
* Construír la imagen con los siguientes parámetros:
   * Nombre: ***web-app***
   * Tag: ***v1***
* Ejecutar el container
* Generar un cambio en el código html y crear nuevamente la imagen

### Recordar

* Con la instrucción ***FROM*** especificamos repositorio e imagen base
* Con la instrucción ***RUN*** ejecutamos un comando
* Con la instrucción ***COPY*** o ***ADD*** agregamos / subimos un archivo a la imagen
* Con la instrucción ***ENTRYPOINT*** o ***CMD*** especificamos el comando a invocar al momento de la instanciación del container.

#### Spoiler alert

En caso de dudas se puede consultar el siguiente [ejemplo](../Soluciones/containers/parte3-construyendo_imagenes.md)