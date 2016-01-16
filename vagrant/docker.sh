# add docker apt-source
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
cat > /etc/apt/sources.list.d/docker.list << EOT
  deb https://apt.dockerproject.org/repo ubuntu-precise main
EOT
apt-get update
apt-cache policy docker-engine

# install docker-engine and start docker daemon
apt-get install -y docker-engine

# install docker-compose
pip install functools32
pip install docker-compose
