sudo apt update

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

sudo apt install -y mongodb

sudo useradd --create-home webrunner
sudo usermod --shell /bin/bash webrunner
# sudo cp /home/ser/python_cre_sh/py_config /etc/systemd/system/pythonserve.service
sudo chmod -R 777 /home/webrunner

cd /home/webrunner

git clone -b furr-dev2 https://github.com/yamileon/poolmanage-ui.git

git clone -b dev https://github.com/yamileon/poolmanager-api.git

cd /home/webrunner/poolmanage-ui
yes | npm install

cd /home/webrunner/poolmanager-api
npm install 

echo '[Unit]
Description=ui server

[Service]
User=webrunner

WorkingDirectory=/home/webrunner/poolmanage-ui

ExecStart=/usr/bin/npm run startg

[Install]

WantedBy=multi-user.target' | sudo tee /etc/systemd/system/poolmanagerui.service


echo '[Unit]
Description=api server

[Service]
User=webrunner

WorkingDirectory=/home/webrunner/poolmanager-api

ExecStart=/usr/bin/node index.js

[Install]

WantedBy=multi-user.target' | sudo tee /etc/systemd/system/poolmanagerapi.service

echo "export const environment = {
  production: false,
  url: 'http://"$1":8080'
};" > /home/webrunner/poolmanage-ui/src/environments/environment.ts

sudo systemctl start poolmanagerapi

sudo systemctl start poolmanagerui

sudo systemctl enable poolmanagerapi
sudo systemctl enable poolmanagerui

sudo systemctl daemon-reload