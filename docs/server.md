## Server部署文档

#### 1. Overall

完整的服务器部署包含如下三个不同的部分

| 部署MYSQL | 部署FLASK | 部署NGINX |
|:-----:|:-----:|:-----:|


#### 1. 下载

请使用如下指令下载部署仓库
```
$ git clone https://github.com/SciQuestDevelopment/deployment.git server
```

当您完成下载后请进入对于路径
```bash 
$ cd server
```


#### 2. 部署MYSQL

您可以使用以下指令启动MYSQL

```bash 
docker-compose up -d mysql
```

当mysql成功运行后您需要给mysql服务器的root账户分配远程访问权限, 请使用如下指令进入mysql服务器client
```sh
$ docker exec -it deployment_flask_1 sh
```
当加入mysql container后, 可以直接运行mysql client 然后分配权限, 请使用以下指令进入mysql client

```sh
$ mysql -uroot -pSciquest12345
```

当进入mysql client后请输入如下指令分配远程访问权限

```sql
GRANT all privileges ON *.* TO 'root'@'%';
```

当执行完成后使用如下指令退出 mysql客户端
```sh
$ exit
```
然后使用再次使用此指令退出docker container
```sh
$ exit
```

请使用以下指令检查是否成功运行mysql服务器

```sh
$ docker ps 
```

如果成功将会看到一个名为`deployment_mysql_1`的容器

#### 4. 部署Flask

直接使用以下指令部署 Flask
```bash 
docker-compose up -d flask
```
请使用以下指令检查是否成功运行 flask 服务器

```sh
$ docker ps 
```

如果成功将会看到一个名为`deployment_flask_1`的容器

#### 4. 部署Nginx

直接使用以下指令部署 Nginx
```bash 
docker-compose up -d nginx
```
请使用以下指令检查是否成功运行 nginx 服务器

```sh
$ docker ps 
```

如果成功将会看到一个名为`deployment_nginx_1`的容器