# install basic development dependencies
apt-get update
apt-get install -y build-essential \
  curl \
  ack \
  python-software-properties \
  python \
  g++ \
  make \
  git \
  python-pip \
  vim

# setup vagrant user 
echo "setting up vagrant user"
cat /vagrant/bash_profile > ~vagrant/.bash_profile
touch ~vagrant/.hush_login

# setup root user
echo "setting up root user"
mkdir -p /root/.ssh/
touch /root/.ssh/authorized_keys
cat ~vagrant/.ssh/authorized_keys >> /root/.ssh/authorized_keys
cat /vagrant/bash_profile > ~root/.bash_profile
cat ~vagrant/.vagrant_profile > ~root/.vagrant_profile
touch ~/.hush_login
