sudo apt-get install -y openssh-server openssh-client iptables

sudo sh -c 'echo "mkdir -p -m0755 /var/run/sshd" >> /etc/rc.local'
sudo sh -c 'echo "/usr/sbin/sshd" >> /etc/rc.local'
sudo sh -c 'echo "/sbin/iptables -I INPUT -p tcp --dport 22 -j ACCEPT" >> /etc/rc.local'

