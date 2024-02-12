#!/usr/bin/env bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#######################################
#           DOCK SETTINGS 
#######################################

# Only show active applications
defaults write com.apple.dock static-only -bool true

# Put the Dock on the bottom of the screen 
defaults write com.apple.dock orientation -string bottom

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Autohide the Dock when the mouse is out 
defaults write com.apple.dock autohide -bool true

# Set the size of the dock icons to 48
defaults write com.apple.dock tilesize -int 48

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Set the animation duration of Dock opening and closing
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Set the autohide delay
defaults write com.apple.dock autohide-delay -float 0

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Scroll up on a Dock icon to show all Space's opened windows
defaults write com.apple.dock scroll-to-open -bool true

# Change the minimize animation effect
defaults write com.apple.dock mineffect -string scale

# Set the magnification to 0
defaults write com.apple.dock magnification -int 0

# Do not show recent apps in the Dock
defaults write com.apple.dock show-recents -bool false

# Wipe all (default) app icons from the Dock
defaults write com.apple.dock persistent-apps -array

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Disable auto rearanging spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

#######################################
#        SCREENSHOT SETTINGS 
#######################################

# Include date time in the screenshot file names
defaults write com.apple.screencapture "include-date" -bool "true"

# Set the defaults screenshots location to Pictures
defaults write com.apple.screencapture "location" -string "~/Pictures" 

# Set the screenshot format to png
defaults write com.apple.screencapture "type" -string "png"

# Disable shadows from screenshots
defaults write com.apple.screencapture "disable-shadow" -bool "true"

# Display the thumbnail after taking the screenshot
defaults write com.apple.screencapture "show-thumbnail" -bool "true"

#######################################
#        FINDER SETTINGS 
#######################################

# Shows all file extensions inside the findeer
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" 

# Show hidden files in finder
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" 

# Change the search scope to current folder in finder
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf" 

# Disable the warning display when changing a file extension in the finder
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "true" 

# Do not save documents to icloud
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

# Set sidebar icon size to medium
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1" 


#######################################
#        KEYBOARD SETTINGS
#######################################

# Disable auto correct
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Enable tab in modal dialogs
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable the press and hold behavior 
defaults write -g ApplePressAndHoldEnabled -bool false

# Enable key repeat at a fast rate
defaults write -g KeyRepeat -int 1 

#######################################
#        AUDIO SETTINGS
#######################################

# Disable sound effectrs on boot
sudo nvram SystemAudioVolume=" "

# Mute system audio
osascript -e 'set volume output muted true'

# Disable startup chime sound
sudo nvram StartupMute=%01

#######################################
#        HOSTNAME SETTINGS
#######################################

sudo scutil --set ComputerName "elmouradi-mbp" && \
sudo scutil --set HostName "elmouradi-mbp" && \
sudo scutil --set LocalHostName "elmouradi-mbp" && \
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "elmouradi-mbp"

#######################################
#        FIREWALL SETTINGS
#######################################

# Enable appplication firewall
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on


# Disable "Application Downloaded from Internet" quarantine warning
defaults write com.apple.LaunchServices "LSQuarantine" -bool "false"

#######################################
#        KILL AFFECTED APPS 
#######################################

for app in "Dock"\
	   "SystemUIServer"\
	   "Finder";
do killall "${app}" &> /dev/null
done
			
