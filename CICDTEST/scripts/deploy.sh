# 가동중인 testcontainer1 컨테이너 중단 및 삭제
sudo docker ps -a -q --filter "name=testcontainer1" | grep -q . && docker stop testcontainer1 && docker rm testcontainer1 | true

# 기존 이미지 삭제
sudo docker rmi {본인 docker_hub_id}/testimage1

# 도커허브 이미지 pull
sudo docker pull {본인 docker_hub_id}/testimage1

# 도커 run
docker run -d -p 8080:80 --name testcontainer1 {본인 docker_hub_id}/testimage1

# 사용하지 않는 불필요한 이미지 삭제 -> 현재 컨테이너가 물고 있는 이미지는 삭제되지 않습니다.
docker rmi -f $(docker images -f "dangling=true" -q) || true