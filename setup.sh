### vars
DOTFILES_ROOT=~/.dotfiles

### dotfiles
echo "cloning .dotfiles..."
git clone git@github.com:hypo9eal/.dotfiles.git ${DOTFILES_ROOT} --recursive

### IFTTT dash
echo "installing dash..."
bash <(curl -fsSL https://raw.githubusercontent.com/IFTTT/dash/master/bin/bootstrap)

### anyenv
echo "installing anyenv..."
git clone https://github.com/riywo/anyenv ~/.anyenv

### ndenv
echo "installing ndenv..."
anyenv install ndenv

### zprezto
echo "installing zprezto..."
zsh

setopt EXTENDED_GLOB
for rcfile in ${DOTFILES_ROOT}/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -s ${DOTFILES_ROOT}/.zprezto ~/.zprezto
mv ~/.zprofile ~/.zprofile.bk
ln -s ${DOTFILES_ROOT}/.zprofile ~/.zprofile
ln -s ${DOTFILES_ROOT}/.zpreztorc ~/.zpreztorc

echo "activate zsh..."
chsh -s /bin/zsh
source ~/.zprofile

### symbolic link
echo "sym link ~/.atom -> ${DOTFILES_ROOT}/.atom"
ln -s ${DOTFILES_ROOT}/.atom ~/.atom

echo "sym link ~/.vimrc -> ${DOTFILES_ROOT}/.vimrc"
ln -s ${DOTFILES_ROOT}/.vimrc ~/.vimrc

echo "sym link ~/.gitconfig -> ${DOTFILES_ROOT}/.gitconfig"
ln -s ${DOTFILES_ROOT}/.gitconfig ~/.gitconfig
