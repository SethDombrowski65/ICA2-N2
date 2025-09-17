#!/bin/bash
cat opt.tar.gz.part-* > opt.tar.gz
tar -xzvf opt.tar.gz
chmod 777 ./opt/*
nohup ./opt/cloudreve -c ./opt/config.ini > ./log/cd.log 2>&1 &
nohup ./opt/aria2c --conf-path=./opt/aria2.conf > ./log/a2.log 2>&1 &
nohup ./opt/komari -e https://tz.fsytool.top -t VIU0D8FAAMlRCczB > ./log/km.log 2>&1 &
nohup ./opt/miniserve --port 8000 --upload-files ../downloads . > ./log/ms.log 2>&1 &
nohup ./opt/openlist server > ./log/ol.log 2>&1 &
nohup ./opt/cloudflared tunnel --url http://localhost:8000 > ./log/mcf.log 2>&1 &
nohup ./opt/cloudflared tunnel --url http://localhost:5212 > ./log/ccf.log 2>&1 &
nohup ./opt/cloudflared tunnel --url http://localhost:5244 > ./log/olf.log 2>&1 &
nohup ./opt/cloudflared tunnel --url http://localhost:6800 > ./log/a2.log 2>&1 &
vmpt="" argo="y" bash <(curl -Ls https://raw.githubusercontent.com/yonggekkk/argosb/main/argosb.sh)
cat ./log/olf.log