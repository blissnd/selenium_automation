docker exec -it $(docker ps | grep selenium | awk '{print $1}') bash
