build:
	- docker build -t smartkit/mysql-utf8:5.7 .
	- docker build -t smartkit/mysql-utf8:latest .

push: build
	- docker push smartkit/mysql-utf8:5.7
	- docker push smartkit/mysql-utf8:latest