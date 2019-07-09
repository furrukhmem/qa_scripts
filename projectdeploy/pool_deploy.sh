sudo apt update

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt install -y mongodb

cd ~

git clone -b furr-dev2 https://github.com/yamileon/poolmanage-ui.git

git clone -b dev https://github.com/yamileon/poolmanager-api.git

cd ~/poolmanage-ui
yes | npm install

cd ~/poolmanager-api
npm install 

echo '[Unit]
Description=ui server

[Service]
User=ser

WorkingDirectory=/home/ser/poolmanage-ui

ExecStart=/usr/bin/npm run startg

[Install]

WantedBy=multi-user.target' | sudo tee /etc/systemd/system/poolmanagerui.service


echo '[Unit]
Description=api server

[Service]
User=ser

WorkingDirectory=/home/ser/poolmanager-api

ExecStart=/usr/bin/node index.js

[Install]

WantedBy=multi-user.target' | sudo tee /etc/systemd/system/poolmanagerapi.service

echo "export const environment = {
  production: false,
  url: 'http://"$1":8080'
};" > ~/poolmanage-ui/src/environments/environment.ts

sudo systemctl start poolmanagerapi

sudo systemctl start poolmanagerui

sudo systemctl enable poolmanagerapi
sudo systemctl enable poolmanagerui

sudo systemctl daemon-reload