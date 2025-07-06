#!/bin/bash

mkdir ~/.config/fish/

cp -r wallpapers ~/.local/

cp config.fish ~/.config/fish/

sudo chsh -s /usr/bin/fish

source ~/.config/fish/config.fish
