#!/usr/bin/env bash
clear
echo Uploading to vps
rsync -rtvzlP ../nothr.in root@nothr.in:/var/www/
clear
echo Uploaded