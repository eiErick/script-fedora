#!/bin/bash

#Atualização de sistema
sudo dnf update
sudo flatpak update
sudo snap refresh

sudo dnf autoremove

echo ""
echo "TUDO ATUALIZADO COM SUCESSO!"
echo ""