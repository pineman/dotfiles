#!/bin/bash
otf2bdf -p 20 -r 96 /usr/share/fonts/TTF/iosevka-fixed-regular.ttf -o iosevka.bdf
sed -i 's/AVERAGE_WIDTH 106/AVERAGE_WIDTH 130/g' iosevka.bdf
bdf2psf --fb iosevka.bdf /usr/share/bdf2psf/standard.equivalents /usr/share/bdf2psf/fontsets/Uni2.512 512 iosevka.psf
sudo cp iosevka.psf /usr/share/kbd/consolefonts/
