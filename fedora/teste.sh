#!/bin/bash

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

# Verifica se o número de argumentos é válido
if [ "$#" -ne 1 ]; then
  echo "Uso: $0 <arquivo>"
  exit 1
fi

# Armazena o nome do arquivo
file="$1"

# Verifica se o arquivo existe
if [ ! -e "$file" ]; then
  echo "Arquivo não encontrado: $file"
  exit 1
fi

# Lê e imprime o conteúdo do arquivo
# cat "$file"
# echo "$file"
# bat "$file"
echo "$programas_flatpak"