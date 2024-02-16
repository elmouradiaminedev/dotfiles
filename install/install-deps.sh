#!/usr/bin/env bash

[ -f ./utils.sh ] && . utils.sh

cd "$(dirname "$0")/.."

function install_brew() {
    info "Setting up homebrew..."
    which -s brew

    if [[ $? != 0 ]] ; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" -y
    else
        brew update
    fi
    success "installed homebrew"

}

function install_deps() {
    brew bundle --file ./brew/Brewfile

    $(brew --prefix)/opt/fzf/install --all
    git clone https://github.com/Aloxaf/fzf-tab ~/.fzf-tab

    success "installed homebrew dependencies ..."


    brew cleanup
    success "cleaned up homebrew"
}

install_brew
install_deps

