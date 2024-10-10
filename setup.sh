#!/bin/bash

# Create a folder who contains downloaded things for the setup
INSTALL_FOLDER=~/.macsetup
mkdir -p $INSTALL_FOLDER
MAC_SETUP_PROFILE=$INSTALL_FOLDER/macsetup_profile

# Xcode Command Line Tools
echo "Installing Xcode Command Line Tools"
softwareupdate -i "Command Line Tools for Xcode" --agree-to-license

# Install Homebrew
if ! hash brew 2>/dev/null; then
  echo "Installing Homebrew"
  yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo "Adding Homebrew to environment"
  echo "eval \"$(/opt/homebrew/bin/brew shellenv)\"" >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew is already installed"
fi

brew install curl wget openssl@3

{
  echo 'export PATH="/usr/local/opt/curl/bin:$PATH"'
  echo 'export PATH="/usr/local/opt/openssl@3/bin:$PATH"'
}>>$MAC_SETUP_PROFILE

# git
echo "Installing git"
brew install git

# Install ZSH
if ! brew list zsh &>/dev/null; then
  echo "Installing zsh"
  brew install zsh zsh-completions
fi

sudo chmod -R 755 /usr/local/share/zsh
sudo chown -R root:staff /usr/local/share/zsh
{
  echo "if type brew &>/dev/null; then"
  echo "  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH"
  echo "  autoload -Uz compinit"
  echo "  compinit"
  echo "fi"
} >>$MAC_SETUP_PROFILE

# Set ZSH as the default shell
if [ "$SHELL" != "/opt/homebrew/bin/zsh" ]; then
  echo "Setting ZSH as the default shell"
  chsh -s $(which zsh)
fi

echo "Pimping out your terminal"
# Install Oh My Zsh
echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install iTerm2
echo "Installing iTerm2"
brew install --cask iterm2                          # terminal replacement for MacOS

echo "Installing Powerlevel10k theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "Visit: https://github.com/romkatv/powerlevel10k for more information on configuring Powerlevel10k"

# Install cli tools
echo "Installing CLI tools"
brew install ack                                    # search tool like grep, but optimized for programmers
brew install bat                                    # replacement for cat
brew install ctop                                   # htop-like interface for container metrics
brew install htop                                   # interactive process viewer
brew install jq                                     # command-line JSON processor
brew install lsd                                    # replacement for ls
brew install micro                                  # replacement for nano/vi
brew install tldr                                   # Simplified man pages.

# add aliases to profile
{
  echo "alias ls='lsd'"
  echo "alias l='ls -l'"
  echo "alias la='ls -a'"
  echo "alias lla='ls -la'"
  echo "alias lt='ls --tree'"
} >>$MAC_SETUP_PROFILE

brew install z
touch ~/.z
echo '. /usr/local/etc/profile.d/z.sh' >> $MAC_SETUP_PROFILE

# Fonts (https://github.com/ryanoasis/nerd-fonts)
echo "Installing Nerd Fonts"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Browser
echo "Installing Google Chrome"
brew install --cask google-chrome

# Music / Video
echo "Installing Music / Video apps"
brew install --cask spotify
brew install --cask vlc

# Productivity
echo "Installing Productivity apps"
brew install --cask alt-tab                         # cmd-tab replacement
brew install --cask notion                          # note taking app
brew install --cask rectangle                       # window manager
brew install --cask raycast                         # productivity tool
brew install --cask stats                           # system monitoring tool
brew install --cask tomatobar                       # productivity tool

# Communication
echo "Installing Communication apps"
brew install --cask slack

# Dev tools
echo "Installing Dev tools"
brew install --cask ngrok                           # tunnel localhost over internet.
brew install --cask postman                         # Postman makes sending API requests simple.

# IDE
echo "Installing IDEs"
brew install --cask visual-studio-code              # code editor

# Databases
echo "Installing Databases and tools"
brew install timescaledb/tap/timescaledb            # time-series database
brew install postgresql                             # postgresql database
brew install pgcli                                  # postgresql client
brew install --cask beekeeper-studio                # database management tool

# Networking
echo "Installing Networking tools"
brew install wireshark                              # network protocol analyzer
brew install netcat                                 # networking utility
brew install openssl                                # SSL/TLS cryptography library
brew install telnet                                 # telnet client

# Docker
echo "Installing Docker"
brew install --cask docker                          # containerization platform
brew install bash-completion                        # bash completion for docker
brew install docker-compose                         # docker orchestration tool
brew install docker-completion                      # bash completion for docker
brew install docker-compose-completion              # bash completion for docker-compose

# Languages
## Node / JavaScript
if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing NVM"
  brew install nvm
  echo "export NVM_DIR=\"$HOME/.nvm\"" >> ~/.zprofile
  echo "[ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"" >> ~/.zprofile
  export NVM_DIR="$HOME/.nvm"
  . "$NVM_DIR/nvm.sh"
else
  echo "NVM is already installed"
fi

echo "Installing Node"
nvm install node
echo "Installing pnpm"
brew install pnpm

## Go
{
  echo "# Go development"
  echo "export GOPATH=\"\${HOME}/.go\""
  echo "export GOROOT=\"\$(brew --prefix golang)/libexec\""
  echo "export PATH=\"\$PATH:\${GOPATH}/bin:\${GOROOT}/bin\""
}>>$MAC_SETUP_PROFILE
echo "Installing Go"
brew install go

## python
echo "export PATH=\"/usr/local/opt/python/libexec/bin:\$PATH\"" >> $MAC_SETUP_PROFILE
echo "Installing Python"
brew install python
pip install --user pipenv
pip install --upgrade setuptools
pip install --upgrade pip
brew install pyenv
echo 'eval "$(pyenv init -)"' >> $MAC_SETUP_PROFILE

## Java
echo "Installing Java"
curl -s "https://get.sdkman.io" | bash                                                               # sdkman is a tool to manage multiple version of java
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
brew install maven
brew install gradle

# Install Python packages
echo "Installing scapy"
pip3 install scapy

# AWS command line
echo "Installing AWS CLI"
brew install awscli                                 # Official command line
pip3 install saws                                   # Supercharged AWS CLI with auto-completion

# reload profile files.
{
  echo "source $MAC_SETUP_PROFILE # alias and things added by mac_setup script"
}>>"$HOME/.zshrc"

source "$HOME/.zshrc"
