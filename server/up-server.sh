#!/bin/bash

#Atualização de sistema
sudo apt update
sudo apt upgrade
sudo snap refresh

sudo apt autoremove

echo ""
echo "SERVIDOR ATUALIZADO COM SUCESSO!"
echo ""
