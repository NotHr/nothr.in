#!/usr/bin/env bash
clear
echo Uploading to vps
rsync -rtvzlP site/ root@nothr.in:/var/www/site
clear
echo Uploaded