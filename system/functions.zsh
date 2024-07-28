dock-run() { sudo docker run -i -t --privileged $@ ;}
dock-exec() { sudo docker exec -i -t $@ /bin/bash ;}
dock-log() { sudo docker logs --tail=all -f $@ ;}
dock-port() { sudo docker port $@ ;}
dock-vol() { sudo docker inspect --format '{{ .Volumes }}' $@ ;}
dock-ip() { sudo docker inspect --format '{{ .NetworkSettings.IPAddress }}' $@ ;}
dock-rmc() { sudo docker rm sudo docker ps -qa --filter 'status=exited' ;}
dock-rmi() { sudo docker rmi -f sudo docker images | grep '^<none>' | awk '{print $3}' ;}
dock-stop() { sudo docker stop $(docker ps -a -q); }
dock-rm() { sudo docker rm $(docker ps -a -q); }