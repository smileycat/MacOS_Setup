#!/bin/bash

echo "Setting Key Bindings..."
mkdir - p ~/Library/DefaultKeyBindings
cp ./settings/DefaultKeyBinding.dict ~/Library/DefaultKeyBindings/

echo "Setting zsh configs..."
cp ./settings/.zshrc ~/
cp ./settings/.bullet-train.zsh-theme ~/.oh-my-zsh/themes/
cp ./settings/.vimrc ~/

echo "Setting git configs..."
git config --global user.name "smileycat"
git config --global user.email "liaocrong@outlook.com"
git config --global alias.st "status"
git config --global alias.cm "commit -m"
git config --global alias.acm "!git add . && git commit -m"
git config --global credential.helper store

##############################################

echo "Setting Dock..."
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 64
defaults write com.apple.dock largesize -int 86
defaults write com.apple.dock show-recents -bool false
killall Dock

# echo "Finder - Disable warning when changing file extension"
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "TextEdit - Default plain text mode and UTF-8 encodings"
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

echo "Preferences - Reduce keyboard repeat delay"
defaults write -g KeyRepeat 2
