# zprezto
zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

chsh -s /bin/zsh

ln -s ~/.dotfiles/.zprezto/runcoms/zlogin .zlogin
ln -s ~/.dotfiles/.zprezto/runcoms/zlogout .zlogout
ln -s ~/.dotfiles/.zprezto/runcoms/zpreztorc .zpreztorc
ln -s ~/.dotfiles/.zprezto/runcoms/zprofile .zprofile
ln -s ~/.dotfiles/.zprezto/runcoms/zshenv .zshenv
ln -s ~/.dotfiles/.zprezto/runcoms/zshrc .zshrc

# dotfiles
git clone git@github.com:hypo9eal/.dotfiles.git ~/.dotfiles  --recursive

ln -s ~/.dotfiles/.atom ~/.atom
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
