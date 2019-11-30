docker ps | grep selenium | awk '{print $1}' | xargs docker stop
docker ps -a | grep "Exit" | awk '{print $1}' | xargs docker rm
docker images -aq --filter dangling=true | xargs docker rmi
docker rmi selenium_selenium
