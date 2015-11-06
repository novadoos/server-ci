#!/usr/bin/env bash

# Prepare linux for node and install git
cd
sudo apt-get update
sudo apt-get install -y nginx curl build-essential openssl libssl-dev python xdg-utils lynx git

# Get nvm 
git clone git://github.com/creationix/nvm.git ~/.nvm
printf "\n\n# NVM\nif [ -s ~/.nvm/nvm.sh ]; then\n\tNVM_DIR=~/.nvm\n\tsource ~/.nvm/nvm.sh\nfi" >> ~/.bashrc
NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

# Install node
nvm install v0.10.28
nvm alias default 0.10
nvm use 0.10

# Install mongodb
\curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.6.1.tgz
tar -zxvf mongodb-linux-x86_64-2.6.1.tgz
mv -f mongodb-linux-x86_64-2.6.1 mongodb
sudo mkdir -p /data/db
sudo chmod -R 777 /data/db
rm mongodb-linux-x86_64-2.6.1.tgz

# NPM global dependencies
npm install -g bower grunt-cli gulp forever bunyan

# Export $PATH
NEW_PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/vagrant_ruby/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/vagrant_ruby/bin:/home/vagrant/mongodb/bin:/home/vagrant/.nvm/v0.10.28/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/vagrant_ruby/bin'
[ -f ~/.profile ] || touch ~/.profile
[ -f ~/.bash_profile ] || touch ~/.bash_profile
grep 'PATH='$NEW_PATH ~/.profile || echo 'export PATH=$PATH:'$NEW_PATH | tee -a ~/.profile
grep 'PATH='$NEW_PATH ~/.bash_profile || echo 'export PATH=$PATH:'$NEW_PATH | tee -a ~/.bash_profile
. ~/.profile
. ~/.bash_profile