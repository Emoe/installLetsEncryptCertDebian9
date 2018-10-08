#!/bin/bash

# Teste ob Domain mit uebergeben wurde
if [ $# -eq 0 ];then
    echo "Keine Domain angegeben."
    exit 1
fi

# Debian Backports hinzufuegen
echo "deb http://ftp.debian.org/debian stretch-backports main" | sudo tee -a /etc/apt/soruces.list.d/debianBackports.list

# Certbot installieren
sudo apt-get update
sudo apt-get install python-certbot-apache -t stretch-backports

# Certbot starten und Zertifikat erstellen 
sudo certbot --authenticator webroot --installer apache -d $1
