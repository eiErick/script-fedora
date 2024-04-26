#!/usr/bin/env node

const { exec } = require('child_process');
const fs = require('fs');

const fullDate = new Date();
const date = `${fullDate.getDay()}/${fullDate.getMonth()}/${fullDate.getFullYear()}`;
const text = `Flatpak atualizado: ${date}`;

function atualizarFlatpak() {
    exec('flatpak update -y', (error, stdout, stderr) => {
        if (error) {
            console.error(`Erro ao atualizar Flatpak: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`Erro ao atualizar Flatpak: ${stderr}`);
            return;
        }
    fs.appendFileSync("./flatpak.log", `${text}\n`);
    // console.log(`Flatpak atualizado: ${stdout}`);
    });
}

atualizarFlatpak();
