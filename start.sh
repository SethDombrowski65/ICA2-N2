#!/bin/bash
chmod 777 cloudreve
chmod 777 cloudflared
chmod 777 aria2c
nohup ./cloudreve -c config.ini > ./log/cd.log 2>&1 &
nohup ./cloudflared tunnel --url http://localhost:5212 > ./log/ccf.log 2>&1 &
nohup ./aria2c --conf-path=./aria2.conf > ./log/a2.log 2>&1 &