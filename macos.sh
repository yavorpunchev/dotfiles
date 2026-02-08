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

# Apply changes
killall Dock

echo "macOS settings applied!"
