## Construyendo imágenes 

### Instrucción ENV

La instrucción ***ENV*** se utiliza para configurar una variable de entorno cuyo valor se transfiere al container al momento de que se instancia el mismo. Usando la imagen construída en [Parte3](./parte3-construyendo_imagenes.md), modificar el ***index.html*** de forma dinámica usando la instrucción ***ENV***.  

```yaml
FROM .....
ENV SOME_VARIABLE="Some text"
...
...
```

NOTA: Recordar que las variables de entorno pueden ser invocadas con el símbolo `$`, por ejemplo, `$SOME_VARIABLE`.

### Instrucción ADD vs COPY

Revisar la documentación de Docker para entender las diferencias entre ambas instrucciones. Crear un ***Dockerfile*** y aplicar el uso de la instrucción ***ADD*** en lugar de ***COPY***.

### Modificar el Dockerfile

Dado el siguiente ***Dockerfile*** modificarlo para reducir la cantidad de capas al mínimo necesario.

```yaml
FROM ubuntu:20.04
ENV TZ="America/Montevideo"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone # Con este comando seteamos el TimeZone, de lo contrario falla la construcción de la imagen.
RUN apt-get update -y
RUN apt-get install -y apache2 git curl
RUN apt-get clean -y
EXPOSE 80
CMD apachectl -D FOREGROUND
```