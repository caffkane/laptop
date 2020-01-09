#! /usr/bin/env bash

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Get dotfiles
git clone https://github.com/gitguudd/dotfiles.git

# Install zsh
brew install zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cd ~/.oh-my-zsh/themes/
curl -o https://raw.githubusercontent.com/halfo/lambda-mod-zsh-theme/master/lambda-mod.zsh-theme

cd ~

# Install all the packages
brew install asdf \
  coreutils automake autoconf openssl gpg fzf \
  libyaml readline libxslt libtool unixodbc \
  unzip curl tmux postgresql@9.6 nginx nvim

# link dotfiles
cd ~/dotfiles
bash setup.sh

source ~/.zshrc


# Install ruby, nodejs and python
asdf plugin-add ruby && asdf plugin-add nodejs && asdf plugin-add python

# Install needed ruby versions
asdf install ruby 2.6.5 
asdf install ruby 2.3.0
asdf install ruby 2.3.8

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# Install needed nodejs versions
asdf install nodejs 10.16.3
asdf install nodejs 6.17.1
asdf install nodejs 6.14.1

asdf install python 3.8.0

# Global versions
# You will have to set local versions for the repos
asdf global ruby 2.3.8
asdf global nodejs 10.16.3
asdf global python 3.8.0

source ~/.zshrc

# Install powerline
pip3 install --user powerline-status

. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

source ~/.zshrc

# Install dev tools
cd ~/
curl -o https://download.mozilla.org/?product=firefox-latest-ssl&os=osx&lang=en-CA
curl -o https://go.microsoft.com/fwlink/?LinkID=620882
curl -o https://iterm2.com/downloads/stable/iTerm2-3_3_7.zip
curl -o https://dl.pstmn.io/download/latest/osx

