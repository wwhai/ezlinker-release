#！ /bin/bash
git clone https://github.com/wwhai/ezlinker-release
cd ezlinker-release
docker-compose -f ./docker-compose.yml -p ezlinker up -d