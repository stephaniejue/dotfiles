#!/bin/bash

# install cli for xcode
echo '> installing xcode'
sudo xcode-select --install

echo '> installing homebrew'
# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo '> installing oh my zsh'
# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo '  setting zsh to default shell'
# set zsh to default shell
chsh -s $(which zsh)

echo '  copying zshrc'
cp ./zsh/.zshrc ~/.zshrc
echo '> copying vimrc'
cp ./vim/.vimrc ~/.vimrc

PACKAGES=(
  iterm2
  google-chrome
  zoomus
  tableplus
  evernote
  docker
  toggl-track
  1password
  skype-for-business
)

for i in "${PACKAGES[@]}"; do
  echo "> brew installing $i"
  brew cask install "$i"
done

# install manually:
# - teams, word, excel, powerpoint
# - openvpn
