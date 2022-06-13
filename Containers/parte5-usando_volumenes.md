## Usando volúmenes en Docker

### Modo 1 - Tareas

Crear un Dockerfile para que despliegue una app html en un volumen. Tener en cuenta cual es el path de la web según la imagen que se use. 

* Copiar la web hacia la imagen
* Usar la instrucción ***VOLUME***
* Construír la imagen
* Ejecutar el container
* Identificar el path al contenido del ***Volume*** y listar su contenido (por ejemplo, con ls -lh)
* Modificar el contenido


### Modo 2 - Tareas

Generar una copia del Dockerfile anterior y modificarlo para que la web la despliegue desde un directorio en el ***Docker Host***.

* Usar la instrucción ***VOLUME***
* Identificar el path donde tenemos la web creada
* Crear el container montando el directorio donde tenemos la app con el directorio de destino (dentro del container)
* Modificar el contenido


#### Spoiler Alert

En caso de trancarse consultar un ejemplo [acá](../Soluciones/containers/parte5-usando_volumenes.md)