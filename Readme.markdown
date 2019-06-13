# About this repo
This Docker image sets up UTF8 encoding for the MySQL server.

The idea has been taken from http://outofcontrol.ca/blog/comments/change-mysql-5.5-default-character-set-to-utf8 and https://hub.docker.com/r/jamesatwork/docker-mysql-utf-8/~/dockerfile/

## Build

Execute `make build` to build the image, and `make push`to push to Docker Hub.



### MySql start up

#### Install Docker:

1.Ubuntu: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04

2.Windows: https://docs.bitnami.com/containers/how-to/install-docker-in-windows/

3.MacOSX: https://docs.docker.com/docker-for-mac/install/

#### MySql start up(allow remote connection)

```
docker run --name=mysql-utf8 -e MYSQL_ROOT_HOST=% -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -d smartkit/mysql-utf8:5.7
```

or 


```
docker run --name=mysql-utf8 -e MYSQL_ROOT_HOST=% -P -d smartkit/mysql-utf8:5.7
```

### MySql data import

```
docker cp xyz.sql  mysql:/
```

### Docker logs initial root password

```
docker logs mysql | grep GENERATED
```

### change  root password

```
docker exec -it mysql mysql -uroot -p
```

then

```
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
```

allow remot connection

```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';

```

```
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
```

exit mysql

```
docker exec -it mysql /bin/bash
```

```
mysql -u root -p  < xyz.sql
```

### MySql Schemal verify

```
mysql -u root -proot
```

```
desc yourDB.yourTable;
```


#### Verify

```
 mysql -h localhost -port 32771 -u root -p
```

#### References: 

https://dev.mysql.com/doc/mysql-installation-excerpt/5.5/en/docker-mysql-getting-started.html

https://medium.com/@backslash112/start-a-remote-mysql-server-with-docker-quickly-9fdff22d23fd