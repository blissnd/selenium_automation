./docker_clean.sh  2>/dev/null

if [ "$1" == "" ]; then
    echo -en "Usage: docker_run_script <chrome|firefox>\n"
    exit 1
fi

docker-compose up --force-recreate
docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" seleniumautomation_selenium tail -f /dev/null &

sleep 4

docker exec "$(docker ps | grep selenium | awk '{print $1}')" bash -c "export PATH=$PATH:/opt/selenium && cd /opt/selenium && python3 ./selenium_main.py $1"
