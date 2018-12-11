#!/bin/bash

# create ssl certificate
wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
sudo ./certbot-auto certonly --standalone -d localdomain