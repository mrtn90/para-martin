## Levantando varios containers

### Creando varios containers

Vamos a estudiar como se conectan dos o mas containers que comparten un mismo host.  

### Crear dos containers en distintas redes

Ejecutar como root:

```bash
# Crear red interna usando el plugin bridge
$ docker create network red_interna

#crear un container asociado a la red_interna
$ docker run -d -p 80:80 --network red_interna --name web_app1 httpd:2.4

#creamos otro container para testear conectividad
$ docker run -it --name container1 centos:8 /bin/bash
```

NOTA: pasándole el ***/bin/bash*** con ***-it*** ejecutamos una shell de forma interactiva, por lo que simula que estamos "dentro" del container.

```bash
[root@ip-172-31-86-195 ~]# docker run -it --name container1 centos:8 /bin/bash
[root@a907cc1ae29d /]# 
```

Dentro del container podemos probar consumir la web del otro container usando el comando "`curl http://web_app1`"

### Para pensar y responder

* ¿Que pasó?
* ¿Tenemos conectividad desde el container "container1" al container "web_app1"?
* ¿Que pasa si creamos el "container1" bajo la misma "red_interna"?
* ¿A que propiedad del KERNEL le debemos esta segmentación?

