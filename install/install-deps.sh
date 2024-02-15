#!/usr/bin/env bash

[ -f ./utils.sh ] && . utils.sh

cd "$(dirname "$0")/.."


function install_brew() {
    info "Setting up homebrew..."
    which -s brew

    if [[ $? != 0 ]] ; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        brew update
    fi
    success "installed homebrew"

}

function install_deps() {
    brew bundle --file ./brew/Brewfile
    success "installed homebrew dependencies ..."

    curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.23/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

    brew cleanup
    success "cleaned up homebrew"
}

install_brew
install_deps

