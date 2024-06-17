#!/bin/bash


echo -e " ###########################################
Bienvenue dans le lancement de la connection au bureau à distance
#########################################"

echo -e "Vérification des prérequis pour lancer la connection"

if ! dpkg -s freerdp2-x11 
then
  echo -e "Installation de freerdp2-x11"
  sudo apt install -y freerdp2-x11 &&
  echo -e "Installation réussie"
else
  echo -e "====================="
  echo -e "         ✅          "
  echo -e "====================="
fi
if ! dpkg -s etherwake
then 
  echo -e "Installation de etherwake"
  sudo apt install -y etherwake &&
  echo -e "Installation réussie"
else
  echo -e "====================="
  echo -e "         ✅          "
  echo -e "====================="
fi

echo -e "Les packages sont bien installé. Lancement en cours..."
sleep 2s

echo -e "Merci de renseigner les informations suivantes:"

echo -e "Adresse mac séparé pas des :"
read mac

echo -e "Adresse IP:"
read ipadress

echo -e "Utilisateur :"
read user

echo -e "Mot de passe:"
read password

echo -e "Lancement de la machine windows"
wakeonlan $mac &&

echo -e "Lancement de la connection au bureau (Environ 20secondes). Ne fermez pas la fenêtre."
sleep 20s
xfreerdp /u:$user /p:$password /w:1920 /h:1024 /v:$ipadress 
