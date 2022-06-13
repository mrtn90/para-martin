### Modo 1

```yaml
FROM httpd:2.4
COPY ./app/ /usr/local/apache2/htdocs/
RUN chown -R :www-data /usr/local/apache2/htdocs/
VOLUME ["/usr/local/apache2/htdocs"]
```

Luego construír la imagen y ejecutar el container. El volumen se crea por omisión dentro de `/var/lib/docker/volumes`

### Modo 2

```yaml
FROM httpd:2.4
RUN chown -R :www-data /usr/local/apache2/htdocs/
VOLUME ["/usr/local/apache2/htdocs"]
```

Luego de construír la imagen, ejecutar el container con el argumento `-v path/a/la/web/local:/path/al/directorio/imagen`, por ejemplo:  

```bash
docker run -d -p 8080:80 -v ~/web/html/app:/usr/local/apache2/htdocs imagen:v1
```


