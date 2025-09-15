#!/bin/bash
chmod 777 ./opt/*
nohup ./opt/cloudreve -c config.ini > ./log/cd.log 2>&1 &
nohup ./opt/cloudflared tunnel --url http://localhost:5212 > ./log/ccf.log 2>&1 &
nohup ./opt/aria2c --conf-path=./aria2.conf > ./log/a2.log 2>&1 &
nohup ./opt/komari -e https://tz.fsytool.top -t GAiw8-eIDTPme5G6 > ./log/km.log 2>&1 &