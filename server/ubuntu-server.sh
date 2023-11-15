#!/bin/bash 

#Variáveis 
install="sudo apt install"
install_snap="sudo snap install"
up="sudo apt update"
upgrade="sudo apt upgrade"
autoclean="sudo apt autoclean"

#Instalando apps
$up

$install git
$install nodejs
$install nano
$install gcc

echo ""
echo "APPS INSTALADOS!"
echo ""

#Atualizando e Limpando Sistema
up
autoclean

echo ""
echo "SISTEMA ATUALIZANDO E LIMPADO!"
echo ""

#Sucesso
echo ""
echo "TUDO FOI CONCLUíDO!"
echo ""