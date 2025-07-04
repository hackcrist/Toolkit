#!/bin/bash

# install.sh para Phishing y Pentesting Toolkit

clear
echo "============================================="
echo " Instalador de dependencias para la toolkit "
echo "============================================="

echo "Actualizando paquetes..."
pkg update && pkg upgrade -y

echo "Instalando PHP..."
pkg install php -y

echo "Instalando Nmap..."
pkg install nmap -y

echo "Instalando SQLMap..."
pkg install sqlmap -y

echo "Instalando Hydra..."
pkg install hydra -y

echo "Instalando Figlet..."
pkg install figlet -y

echo "Instalando Lolcat..."
pkg install lolcat -y

echo "Instalación completa."

echo "Abriendo tu canal de TikTok..."
termux-open-url https://www.tiktok.com/@ethicalcore?_t=ZT-8xhbDw3hG62&_r=1

echo "Puedes ejecutar: bash toolkit.sh"
