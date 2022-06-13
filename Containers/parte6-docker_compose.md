## Usando docker-compose

### Tareas

1. Usando alguna de las imágenes desarrolladas en clase con la web html de ejemplo, crear un ***docker-compose.yml*** para que despliegue un container
2. Crear un ***docker-compose.yml*** para construír una imagen que contenga una web en html. Re-utilizar alguno de los ***Dockerfile*** desarrollados.
3. Investigar de qué forma podemos crear 2 réplicas del mismo container usando docker-compose o docker stack

#### Recordar

- El comando `docker-compose up -d` inicializa los containers en modo "detached"
- Los containers e imagenes creados con un docker-compose son nombrados segun el directorio que contiene el archivo docker-compose.yml y el nombre del ***Service*** declarado en el mismo.
- Docker stack no soporta construír imágenes, por lo que debemos de construirlas usando `docker build` si queremos usar esa imagen con ***Docker stack***