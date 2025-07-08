#!/bin/bash

./light-software.sh

cp -r wallpapers ~/.local/

sudo chsh -s /usr/bin/fish y

cp config.fish ~/.config/fish/

source ~/.config/fish/config.fish
