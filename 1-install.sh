#!/bin/bash

1-install.sh

cp -r wallpapers ~/.local/

cp config.fish ~/.config/fish/

sudo chsh -s /usr/bin/fish y

source ~/.config/fish/config.fish
