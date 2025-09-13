#!/usr/bin/env bash
################################################################
# General UI/UX
################################################################

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false



################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
################################################################

# Enable tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate, and make it happen more quickly.
# (The KeyRepeat option requires logging out and back in to take effect.)
defaults write NSGlobalDomain InitialKeyRepeat -int 20
defaults write NSGlobalDomain KeyRepeat -int 1

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false



################################################################
# Desktop & Dock & Mission Control
################################################################

# Set Dock icon size
defaults write com.apple.dock tilesize -int 60

# Dock magnification
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 128

# Hide the Dock automatically
defaults write com.apple.dock autohide -bool true

# Set the Dock to hide immediately
defaults write com.apple.dock autohide-time-modifier -float 0

# Set the Dock to not show recent applications
defaults write com.apple.dock show-recents -bool false

# Disable rearrangement of spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Reset the Dock to apply changes
killall Dock



# Disable tiling by dragging windows to screen borders
# Remove this, if Rectangle app is not used
defaults write com.apple.WindowManager EnableTilingByEdgeDrag -bool false

#################################################################
# Finder
################################################################

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Use column view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Reset Finder to apply changes
killall Finder



#################################################################
# Safari
################################################################

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true



#################################################################
# App Store
#################################################################

# Disable in-app rating requests from apps downloaded from the App Store.
defaults write com.apple.appstore InAppReviewEnabled -int 0

# Write sha256 of this script to track if it has changed
shasum -a 256 "$HOME/.osx.sh" | awk '{print $1}' > "$HOME/.osx.sh.done"
