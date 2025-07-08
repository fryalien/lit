#!/bin/bash

./light-software.sh

cp -r wallpapers ~/.local/

chsh -s /usr/bin/fish

cp config.fish ~/.config/fish/

source ~/.config/fish/config.fish
