#!/bin/bash

# install.sh para Phishing y Pentesting Toolkit

clear
echo "============================================="
echo "  Instalador de dependencias para la toolkit "
echo "============================================="

echo "Actualizando paquetes..."
pkg update && pkg upgrade -y

echo "Instalando PHP, nmap, sqlmap, hydra, figlet y lolcat..."
pkg install php nmap sqlmap hydra figlet lolcat -y

echo "Instalación completa. Puedes ejecutar bash toolkit.sh"
echo "Síguenos en TikTok para más contenido: https://www.tiktok.com/@ethicalcore?_t=ZT-8xhbDw3hG62&_r=1"
