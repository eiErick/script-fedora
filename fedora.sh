#!/bin/bash 

#Variáveis 
install="sudo dnf install -y"
remove="sudo dnf remove -y"
install_snap="sudo snap install"
up="sudo dnf update -y"
autoclean="sudo dnf autoclean -y"

EXTENSOES_INSTALADAS=$(gnome-extensions list --enabled --user | awk '{print $1}')

programas_flatpak=(
	app.drey.Dialect
	com.bitwarden.desktop
	com.discordapp.Discord
	com.github.finefindus.eyedropper
	com.github.tchx84.Flatseal
	com.github.unrud.VideoDownloader
	com.spotify.Client
	com.valvesoftware.Steam
	com.visualstudio.code
	fr.handbrake.ghb
	hu.kramo.Cartridges
	io.bassi.Amberol
	# io.github.celluloid_player.Celluloid
	io.github.giantpinkrobots.flatsweep
	io.github.shiftey.Desktop
	io.gitlab.theevilskeleton.Upscaler
	net.epson.epsonscan2
	org.flatpak.Builder
	org.gimp.GIMP
	org.gnome.Boxes
	org.gnome.Builder
	org.gnome.Calendar
	org.gnome.Dictionary
	org.gnome.Geary
	org.gnome.Loupe
	org.gnome.Loupe.HEIC
	org.gnome.Shotwell
	org.gnome.Todo
	org.gnome.clocks
	org.gnome.gitlab.cheywood.Iotas
	org.libreoffice.LibreOffice
	org.mozilla.firefox
	org.ppsspp.PPSSPP
	org.videolan.VLC
)

#Instalando apps
for nome_do_programa in ${programas_flatpak[@]}; do
  if ! flatpak list | grep -q $nome_do_programa; then
    flatpak install flathub $nome_do_programa -y
  else
    echo "[INSTALADO] - $nome_do_programa"
  fi
done
echo ""
echo "TODOS OS APPS FLATPAKs FORAM INSTALADOS!"
echo ""

$install snapd
$install gnome-tweaks
$install git
$install nodejs
#$install yaru-theme.noarch

$install_snap multipass
$install_snap authy
$install_snap chromium

echo ""
echo "TODOS OS APPS RPMs FORAM INSTALADOS!"
echo ""

#Criando VM do Ubuntu Com Multipass
multipass launch 22.04 --name server

echo ""
echo "VM CRIADA!"
echo ""

#Removendo apps

$remove firefox

#Removendo Extenções
for extensao in $EXTENSOES_INSTALADAS; do
  gnome-extensions disable "$extensao"
  echo "Removendo extensão - $extensao"
done
echo ""
echo "TODAS AS EXTENSÕES FORAM DESATIVADAS!"
echo ""

#Atualizando e Limpando Sistema
$up
$autoclean
echo ""
echo "SISTEMA ATUALIZANDO E LIMPADO!"
echo ""

#Sucesso
echo ""
echo "TUDO FOI CONCLUíDO!"
echo ""
