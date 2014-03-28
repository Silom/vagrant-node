apt-get update -y -q
apt-get install git build-essential mongodb -y -q

wget --quiet http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz

tar -zxf node-v0.10.26-linux-x64.tar.gz

mv node-v0.10.26-linux-x64/ /opt/node/
ln -s /opt/node/bin/node /usr/bin/node
ln -s /opt/node/bin/npm /usr/bin/npm

npm install -g grunt-cli
npm install -g bower

cd /var/nodespace/project/ && npm install && bower install

mongorestore --db mongoDump /var/nodespace/resource/mongoDump/

echo "export LC_ALL=en_US.UTF-8" >> /home/vagrant/.bashrc
