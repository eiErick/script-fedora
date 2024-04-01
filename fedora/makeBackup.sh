#!/bin/bash
paste="./data"

if [ -d "$paste" ]; then
	echo "ATENÇÃO: A pasta $paste já existe neste diretório, deseja apagar? [s/n]"

	read response
	if [ "$response" == "s" ]; then
		echo ""
		echo "Reescrevendo..."
	else
		echo ""
		echo "Operação cancelada!"
		exit
	fi

else
	mkdir $paste
fi

touch $paste/flatpak.txt
touch $paste/snap.txt
touch $paste/extensions.txt

flatpak list --app --columns=application > $paste/flatpak.txt
snap list | awk '{print $1}' | tail -n +2 > $paste/snap.txt
gnome-extensions list > $paste/extensions.txt

cp ~/.bash_aliases $paste
mv $paste/.bash_aliases $paste/aliases.txt

echo ""
echo "Seus dados foram salvos em '$paste'"

# commit de documents

echo ""
echo "Você deseja fazer commit da pasta Documents? [s/n]"
read response
if [ "$response" == "s" ]; then
	echo ""
	echo "Fazendo commit..."

	echo ""
	cd ~/Documents
	git add .
	git commit -m "$(date '+backup: %d/%m/%Y')"

	echo ""
	echo "commit realizado com sucesso..."
else
	echo ""
	echo "Operação de commit da pasta Documents foi cancelada!"
fi

echo ""