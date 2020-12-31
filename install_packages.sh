#!/bin/bash
echo "Installing xcode-cli tools"
xcode-select --install

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Updating brew..."
brew upgrade && brew update

echo "Installing brew formulaes..."
brew install git node zsh zsh-completions mas

echo "Installing casks..."
brew install --cask docker visual-studio-code google-chrome sourcetree intellij-idea-ce
brew install --cask mongodb-compass postman iina tiles steam folx appcleaner musescore
brew install --cask qlvideo qlstephen qlmarkdown syntax-highlight
xattr -d -r com.apple.quarantine ~/Library/QuickLook/

echo "Cleaning up brew..."
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
