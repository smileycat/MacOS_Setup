#!/bin/bash
echo "Installing xcode-cli tools..."
xcode-select --install

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing homebrew formulae..."
brew install git node java zsh zsh-completions mas

echo "Setting git configs..."
git config --global user.name "smileycat"
git config --global user.email "liaocrong@outlook.com"
git config --global alias.st "status"
git config --global alias.cm "commit -m"
git config --global alias.acm "!git add . && git commit -m"
git config --global credential.helper store

echo "Installing ohmyzsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setting zsh configs..."
cp ./settings/.vimrc ~/
cp ./settings/.zshrc ~/
cp ./settings/bullet-train.zsh-theme ~/.oh-my-zsh/themes/
chsh -s $(which zsh)

echo "Installing powerline-fonts..."
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

# Please signin to App Store before starting the script
apps=(
    Messenger LINE unarchiver colorslurp JSONPeep Cascadea
    "Intelligent Translator" "Adblock Plus for Safari ABP"
)

for app in "${apps[@]}"; do
    echo -e "\nInstalling "$app"..."
    mas lucky "$app"
done

echo "Installing homebrew casks..."
brew install --cask qlvideo qlstephen qlmarkdown syntax-highlight tiles
xattr -d -r com.apple.quarantine ~/Library/QuickLook/
brew install --cask docker visual-studio-code google-chrome sourcetree intellij-idea-ce insomnia
brew install --cask mongodb-compass iina steam folx appcleaner musescore adobe-creative-cloud
brew install --cask microsoft-word microsoft-excel vmware-fusion

echo "Cleaning up homebrew..."
brew cleanup
