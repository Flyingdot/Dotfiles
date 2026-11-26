#!/bin/bash
# macOS preferences, mirrored from the current machine. Safe to re-run.
set -euo pipefail

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 39
defaults write com.apple.dock show-recents -bool false

# Finder
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"            # list view
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"            # search current folder
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Keyboard & text
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false            # key repeat instead of accent popup
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2                       # tab through all controls
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Appearance (fully applies after logout)
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

killall Dock Finder 2>/dev/null || true
