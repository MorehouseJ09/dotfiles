sudo apt-get install -y openssh-server openssh-client iptables

sudo sh -c 'mkdir -p -m0755 /var/run/sshd'
sudo sh -c '/sbin/iptables -I INPUT -p tcp --dport 22 -j ACCEPT'
sudo sh -c '/usr/sbin/sshd'
