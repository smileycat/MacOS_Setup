#!/bin/bash
# Please signin to App Store before executing the script

source constants.sh
echo "PROCEED TO INSTALL DEV TOOLS AND:"
echo "QUICKLOOK  "$QUICKLOOK
echo "FORMULAE   "$BREW_FORMULAE
echo "CASKS      "$BREW_CASKS
echo "APPS       "${APPS[@]}
echo
read -p "Continue? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

echo "Installing xcode-cli tools..."
xcode-select --install

read -p "Once xcode installation is completed, press any key to continue..."
echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing homebrew formulae..."
brew install $BREW_FORMULAE

echo "Setting git configs..."
git config --global user.name "smileycat"
git config --global user.email "liaocrong@outlook.com"
git config --global alias.st "status"
git config --global credential.helper store

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setting zsh configs..."
cp ./settings/.vimrc ~
cp ./settings/.zshrc ~
cp ./settings/bullet-train.zsh-theme ~/.oh-my-zsh/themes
chsh -s $(which zsh)

echo "Installing powerline-fonts..."
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

for app in "${APPS[@]}"; do
    echo -e "\nInstalling "$app"..."
    mas lucky "$app"
done

echo "Installing homebrew casks..."
brew install --cask $QUICKLOOK
brew install --cask $BREW_CASKS

echo "Restarting quicklook..."
xattr -d -r com.apple.quarantine ~/Library/QuickLook/
qlmanage -r cache

echo "Cleaning up homebrew..."
brew cleanup
