#!/bin/bash

# macOS system preferences
# Apply with: ./macos.sh

echo "Applying macOS settings..."

# Hot corners
# Possible values:
#  0: No action     5: Start Screen Saver   11: Launchpad
#  2: Mission Control   6: Disable Screen Saver  12: Notification Center
#  3: Application Windows  10: Put Display to Sleep  13: Lock Screen
#  4: Desktop       14: Quick Note
#
# Modifier keys:
#  0: No modifier  131072: Shift  262144: Control  524288: Option  1048576: Command

# Bottom-left corner → Mission Control
defaults write com.apple.dock wvous-bl-corner -int 2
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom-right corner → Desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

# Click wallpaper to reveal desktop (false = "Only in Stage Manager")
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# ----------------------------------------
# Finder
# ----------------------------------------

# Default to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Search current folder by default (instead of whole Mac)
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Hide hidden files
defaults write com.apple.finder AppleShowAllFiles -bool false

# Show path bar at bottom
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar at bottom
defaults write com.apple.finder ShowStatusBar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable warning when emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Open new windows to home folder
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Show external drives on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# ----------------------------------------
# Dock
# ----------------------------------------

# Icon size and magnification
defaults write com.apple.dock tilesize -int 35
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 55

# Scale minimize effect (instead of genie)
defaults write com.apple.dock mineffect -string "scale"

# Minimize windows into their app icon
defaults write com.apple.dock minimize-to-application -bool true

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# Don't show recent apps
defaults write com.apple.dock show-recents -bool false

# Don't rearrange Spaces based on recent use
defaults write com.apple.dock mru-spaces -bool false

# ----------------------------------------
# Trackpad & Mouse
# ----------------------------------------

# Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Trackpad speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 1.5

# Mouse speed
defaults write NSGlobalDomain com.apple.mouse.scaling -int 3

# ----------------------------------------
# System
# ----------------------------------------

# Auto switch between Dark/Light mode
defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Temperature unit: Celsius
defaults write NSGlobalDomain AppleTemperatureUnit -string "Celsius"

# Disable double-space to period
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ----------------------------------------
# Accessibility
# ----------------------------------------

# Enable scroll gesture zoom (Command + scroll)
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 1048576

# ----------------------------------------
# Control Center
# ----------------------------------------

# Show battery percentage
defaults write com.apple.controlcenter BatteryShowPercentage -bool true

# Apply changes
killall Dock
killall Finder
killall SystemUIServer 2>/dev/null || true
killall ControlCenter 2>/dev/null || true

echo "macOS settings applied!"
