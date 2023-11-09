#!/bin/bash 

#Variáveis 
install="sudo dnf install"
up="sudo dnf update"
up_flatpak="flatpak update"
autoclean="sudo dnf autoclean"

EXTENSOES_INSTALADAS=$(gnome-extensions list --enabled --user | awk '{print $1}')

programas_flatpak=(
	app.drey.Dialect
	app.drey.Warp
	com.authy.Authy
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
	io.github.celluloid_player.Celluloid
	io.github.flattool.Warehouse
	io.github.giantpinkrobots.flatsweep
	io.github.shiftey.Desktop
	io.gitlab.gregorni.Letterpress
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

$install gnome-tweaks
echo ""
echo "TODOS OS APPS RPMs FORAM INSTALADOS!"
echo ""

#Removendo Extenções
for extensao in $EXTENSOES_INSTALADAS; do
  gnome-extensions disable "$extensao"
  echo "Removendo extensão - $extensao"
done
echo ""
echo "TODAS AS EXTENSÕES FORAM DESATIVADAS!"
echo ""

#Atualizando e Limpando Sistema
up
up_flatpak
autoclean
echo ""
echo "SISTEMA ATUALIZANDO E LIMPADO!"
echo ""

#Sucesso
echo ""
echo "TUDO FOI CONCLUíDO!"
echo ""
