#!/bin/bash
echo "Setting key bindings..."
mkdir -p ~/Library/KeyBindings
cp ./settings/DefaultKeyBinding.dict ~/Library/KeyBindings/

echo "Setting keyboard and touchpad..."
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
# disables the accent key menu when holding a key
defaults write -g ApplePressAndHoldEnabled -bool false
# touchpad click firmness - light
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

defaults write -g AppleWindowTabbingMode -string always
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool true

echo "Setting dock..."
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 64
defaults write com.apple.dock largesize -int 86
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock showAppExposeGestureEnabled -bool true
killall Dock

echo "Disable DS_Store on network & external drives..."
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

echo "Setting finder..."
defaults write com.apple.finder SidebarWidth -int 144
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder NewWindowTargetPath -string "file://"$HOME"/Downloads/"
defaults write com.apple.finder NSUserKeyEquivalents -dict-add \
    "Clean Up" "@r" \
    Open "@\\U21a9" \
    Back "@\\U2190" \
    Forward "@\\U2192"
killall Finder

echo "Setting safari..."
defaults write com.apple.Safari NSUserKeyEquivalents -dict-add \
    Back "@\\U2190" \
    Forward "@\\U2192"
killall Safari

echo "TextEdit - Default plain text mode and UTF-8 encodings"
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

read -p "Press any key to restart to take effect..."
sudo shutdown -r now
