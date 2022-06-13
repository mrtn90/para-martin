### Crear un container con docker-compose


```yaml
version: "3.3"
services:
  web:
    image: httpd:2.4
    ports:
      - "8080:80"
```

### Crear una imagen con docker-compose

Estructura general de directorios:

```bash
.
|-- docker-compose.yml
`-- web
    |-- app
    |   `-- index.html
    `-- Dockerfile

2 directories, 3 files
```

**docker-compose**

```yaml
version: "3.3"
services:
  web:
    build: ./web
    ports:
      - "8080:80"
```
**Dockerfile**

```yaml
FROM centos:centos7
RUN yum install -y httpd iputils curl
COPY ./app/ /var/www/html/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
```

Contenido de web

```bash
.
|-- app
|   `-- index.html
`-- Dockerfile

1 directory, 2 files
```


