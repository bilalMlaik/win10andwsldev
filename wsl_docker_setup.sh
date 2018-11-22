# Install Docker Daemon/Client

ENV DOCKER_VERSION docker-18.09.0.tgz
ENV DOCKER_COMPOSE 1.23.1

curl https://download.docker.com/linux/static/stable/x86_64/$DOCKER_VERSION > ~/docker.tar.gz
tar xzvf ~/docker.tar.gz
sudo mv ~/docker/docker /usr/local/bin/docker
rm -rf ~/docker
rm -f ~/docker.tar.gz

# Install docker-compose client
curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE/docker-compose-`uname -s`-`uname -m` > ~/docker-compose
chmod +x ~/docker-compose
sudo mv ~/docker-compose /usr/local/bin/docker-compose

# point client to docker engine running in windows
echo "DOCKER_HOST=tcp://127.0.0.1:2375 ; export DOCKER_HOST" >> ~/.bashrc
source ~/.bashrc

# test clients
docker --version
docker-compose --version