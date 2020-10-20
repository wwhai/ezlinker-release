# ezlinker-release
## EZLINKER
### 1.快速启动
```shell
git clone https://github.com/wwhai/ezlinker-release
cd ezlinker-release
docker-compose -f ./docker-compose.yml -p ezlinker up -d
```
### 2.注意事项
1. 环境准备
需要一个干净的Linux系统，并且提前安装好Docker和DockerCompose
2. 操作权限
如果不是root权限注意加上sudo
3. 删除环境
```shell
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker volume prune
docker network prune
```
> 注意：该命令会删除所有镜像！！！请不要在生产环境下使用！！！