#!/bin/zsh

#
# Vars
#

DOTFILES_ROOT=~/.dotfiles

#
# Shell
#

echo "\n>> activate zsh..."
chsh -s /bin/zsh
# source ~/.zprofile

#
# zprezto
#

echo "\n>> installing zprezto..."
# zsh

setopt EXTENDED_GLOB

mv ~/.zprezto ~/.zprezto.bk
ln -s ${DOTFILES_ROOT}/.zprezto ~/.zprezto
mv ~/.zpreztorc ~/.zpreztorc.bk
ln -s ${DOTFILES_ROOT}/.zpreztorc ~/.zpreztorc
mv ~/.zprofile ~/.zprofile.bk
ln -s ${DOTFILES_ROOT}/.zprofile ~/.zprofile
mv ~/.zshrc ~/.zshrc.bk
ln -s ${DOTFILES_ROOT}/.zshrc ~/.zshrc
mv ~/.zlogin ~/.zlogin.bk
ln -s ${DOTFILES_ROOT}/.zprezto/runcoms/zlogin ~/.zlogin
mv ~/.zlogout ~/.zlogout.bk
ln -s ${DOTFILES_ROOT}/.zprezto/runcoms/zlogout ~/.zlogout
mv ~/.zshenv ~/.zshenv.bk
ln -s ${DOTFILES_ROOT}/.zprezto/runcoms/zshenv ~/.zshenv

echo "\n>> reload profile..."
source ~/.zprofile

#
# IFTTT dash
#

echo "\n>> installing dash..."
curl -fsSL https://raw.githubusercontent.com/IFTTT/dash/master/bin/bootstrap | bash

#
# *env
#

### anyenv
echo "\n>> installing anyenv..."
git clone https://github.com/riywo/anyenv /usr/local/var/anyenv

echo "\n>> reload profile..."
source ~/.zprofile

# direnv
echo "\n>> installing direnv..."
brew install direnv


#
# Node.js
#

### ndenv
echo "\n>> installing ndenv..."
anyenv install ndenv

#
# Python
#

### pyenv
echo "\n>> installing pyenv..."
anyenv install pyenv

### virtualenv
echo "\n>> installing virtualenv..."
pip install --upgrade pip
pip install virtualenv

#
# Symlink
#

echo "\n>> symbolic link ~/.vimrc -> ${DOTFILES_ROOT}/.vimrc"
ln -s ${DOTFILES_ROOT}/.vimrc ~/.vimrc

echo "\n>> symbolic link ~/.gitconfig -> ${DOTFILES_ROOT}/.gitconfig"
ln -s ${DOTFILES_ROOT}/.gitconfig ~/.gitconfig

echo "\n>> symbolic link ~/.atom -> ${DOTFILES_ROOT}/.atom"
ln -s ${DOTFILES_ROOT}/.atom ~/.atom

echo "\n>> symbolic link /usr/local/share/git-core/contrib/diff-highlight/diff-highlight -> /usr/local/bin"
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin

echo "\n>> symbolic link ~/.dotfiles/.iterm -> ~/iterm"
ln -s ${DOTFILES_ROOT}/.iterm ~/iterm

echo "\n>> symbolic link /System/.../airport -> /usr/local/bin/airport"
ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport

echo "\n>> symbolic link ~/.dotfiles/.direnvrc -> ~/.direnvrc"
ln -s ${DOTFILES_ROOT}/.direnvrc ~/.direnvrc

exec $SHELL -l
