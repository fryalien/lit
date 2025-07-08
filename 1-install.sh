#!/bin/bash

./light-software.sh

cp -r wallpapers ~/.local/

mkdir -p ~/.config/fish/

cp config.fish ~/.config/fish/

sudo chsh -s /usr/bin/fish y

source ~/.config/fish/config.fish
