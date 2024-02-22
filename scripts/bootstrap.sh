#!/bin/bash

DOTFILES=$HOME/dotfiles
SCRIPTS=$DOTFILES/scripts

source $SCRIPTS/utils.sh
source $SCRIPTS/install.sh
source $SCRIPTS/osx.sh
source $SCRIPTS/stow.sh

function start() {
	info "Starting services..."
	skhd --restart-service
	yabai --restart-service
}

start
