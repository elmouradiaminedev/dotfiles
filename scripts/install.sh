#!/bin/bash

function install_xcode_clt() {
	# Check if Xcode Command Line Tools are installed
	info "Checking Xcode Command Line Tools..."

	if xcode-select --version &>/dev/null; then
		info "Xcode Command Line Tools are already installed."
	else
		# Xcode Command Line Tools not installed, so install them
		info "Installing Xcode Command Line Tools..."
		xcode-select --install

		# Check the exit status of the xcode-select command
		if [[ $? -eq 0 ]]; then
			success "Installed Xcode Command Line Tools."
		else
			error "Failed to install Xcode Command Line Tools. Exiting."
			exit 1
		fi
	fi
}

function install_brew() {
	info "Setting up Homebrew..."
	which -s brew

	if [[ $? != 0 ]]; then
		# Homebrew not installed, so install it
		info "Installing Homebrew..."
		bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

		if [[ $? != 0 ]]; then
			# Installation failed
			error "Failed to install Homebrew. Exiting."
			exit 1
		else
			eval "$(/opt/homebrew/bin/brew shellenv)"
			success "Installed Homebrew."
		fi
	else
		# Homebrew already installed, so update it
		info "Homebrew already installed. Updating..."
		brew update

		if [[ $? != 0 ]]; then
			# Update failed
			error "Failed to update Homebrew. Exiting."
			exit 1
		else
			success "Updated Homebrew."
		fi
	fi
}

function install_omz() {
	# Check if Oh My Zsh is installed
	info "Setting up Oh My Zsh..."

	if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
		# Oh My Zsh not installed, so install it
		info "Installing Oh my zsh..."
		bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

		if [[ $? != 0 ]]; then
			# Installation failed
			error "Failed to install Oh My Zsh. Exiting."
			exit 1
		else
			success "Installed Oh My Zsh."
		fi
	else
		# Oh My Zsh already installed, so update it
		info "Oh My Zsh already installed. Updating..."
		bash -c "$HOME/.oh-my-zsh/tools/upgrade.sh"

		if [[ $? != 0 ]]; then
			# Update failed
			error "Failed to update Oh My Zsh. Exiting."
			exit 1
		else
			success "Updated Oh My Zsh."
		fi
	fi
}

function install_brew_deps() {
	# Install Homebrew dependencies from Brewfile
	info "Installing Homebrew dependencies..."
	brew bundle --file $DOTFILES/Brewfile

	# Check the exit status of the brew bundle command
	if [[ $? -eq 0 ]]; then
		success "Installed Homebrew dependencies."
	else
		error "Failed to install Homebrew dependencies. Exiting."
		exit 1
	fi

	# Clean up Homebrew
	info "Cleaning up Homebrew..."
	brew cleanup --quiet
	success "Cleaned up Homebrew."
}

function install_custom_deps() {
	info "Installing custom dependencies..."
	local fzf_tab_plugin_dir="${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab"

	# Check if the directory exists
	if [ -d "$fzf_tab_plugin_dir" ]; then
		info "Updating fzf-tab..."
		# Directory exists, pull updates
		(cd "$fzf_tab_plugin_dir" && git pull)
	else
		# Directory doesn't exist, clone the repository
		info "Installing fzf-tab..."
		git clone https://github.com/Aloxaf/fzf-tab "$plugin_dir"
	fi

	success "Installed custom dependencies successfully"
}

install_xcode_clt
install_brew
install_omz
install_brew_deps
install_custom_deps
