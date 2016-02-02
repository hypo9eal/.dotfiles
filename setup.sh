### vars
DOTFILES_ROOT=~/.dotfiles

### dotfiles
git clone git@github.com:hypo9eal/.dotfiles.git ${DOTFILES_ROOT} --recursive

### IFTTT dash
bash <(curl -fsSL https://raw.githubusercontent.com/IFTTT/dash/master/bin/bootstrap)

### anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
anyenv install ndenv

### zprezto
zsh

setopt EXTENDED_GLOB
for rcfile in ${DOTFILES_ROOT}/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -s ${DOTFILES_ROOT}/.zprezto ~/.zprezto
mv ~/.zprofile ~/.zprofile.bk
ln -s ${DOTFILES_ROOT}/.zprofile ~/.zprofile
ln -s ${DOTFILES_ROOT}/.zpreztorc ~/.zpreztorc

chsh -s /bin/zsh
source ~/.zprofile

### symbolic link

ln -s ${DOTFILES_ROOT}/.atom ~/.atom
ln -s ${DOTFILES_ROOT}/.vimrc ~/.vimrc
ln -s ${DOTFILES_ROOT}/.gitconfig ~/.gitconfig
