#!/bin/bash
echo "Installing xcode-cli tools"
xcode-select --install

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Updating homebrew..."
brew upgrade && brew update

echo "Installing homebrew formulae..."
brew install git node java zsh zsh-completions mas

echo "Installing casks..."
brew install --cask docker visual-studio-code google-chrome sourcetree intellij-idea-ce postman
brew install --cask mongodb-compass iina steam folx appcleaner musescore adobe-creative-cloud
brew install --cask qlvideo qlstephen qlmarkdown syntax-highlight tiles
xattr -d -r com.apple.quarantine ~/Library/QuickLook/

echo "Cleaning up homebrew..."
brew cleanup

echo "Installing ohmyzsh..."
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing powerline-fonts"
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

echo "Installing App Store Apps..."
mas signin liaocrong@gmail.com
mas lucky messenger
mas lucky LINE
mas lucky unarchiver
mas lucky colorslurp
mas lucky JSONPeep
mas lucky Cascadea
mas lucky "Adblock plus"
mas lucky "Intelligent Translator"
