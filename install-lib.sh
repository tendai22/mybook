#! /bin/sh
# Install script for vivliotyle

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh |bash

# install nodejs v18 (newer or equal to v14)
nvm install v18.13.0

# install nvm, so 
# install vivliostyle
npm create book mybook
npm install -g npm@9.4.0

# installing additional libraries for vivliostyle ()
sudo apt-get install -y libatk1.0-0 libatk-bridge2.0-0 libcups2
sudo apt-get install -y libxdamage-dev libgpm-dev libgbm-dev
sudo apt-get install libxkbcommon-dev libpango-1.0 libcairo-dev

# start vivliostyle
cd mybook
npm run build
