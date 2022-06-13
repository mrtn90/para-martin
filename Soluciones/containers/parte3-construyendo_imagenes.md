### Dockerfile

```yaml
FROM centos:centos7
RUN yum install -y httpd iputils curl
COPY ./index.html/ /var/www/html/
EXPOSE 80
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
```
