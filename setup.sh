### vars
DOTFILES_ROOT=~/.dotfiles

### dotfiles
echo ">> cloning .dotfiles..."
git clone git@github.com:hypo9eal/.dotfiles.git ${DOTFILES_ROOT} --recursive

### zprezto
echo ">> installing zprezto..."
zsh

setopt EXTENDED_GLOB
for rcfile in ${DOTFILES_ROOT}/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -s ${DOTFILES_ROOT}/.zprezto ~/.zprezto
ln -s ${DOTFILES_ROOT}/.zpreztorc ~/.zpreztorc
mv ~/.zprofile ~/.zprofile.bk
ln -s ${DOTFILES_ROOT}/.zprofile ~/.zprofile
mv ~/.zshrc ~/.zshrc.bk
ln -s ${DOTFILES_ROOT}/.zshrc ~/.zshrc

echo ">> activate zsh..."
chsh -s /bin/zsh
source ~/.zprofile

### IFTTT dash
echo ">> installing dash..."
bash <(curl -fsSL https://raw.githubusercontent.com/IFTTT/dash/master/bin/bootstrap)

### anyenv
echo ">> installing anyenv..."
git clone https://github.com/riywo/anyenv ~/.anyenv

### ndenv
echo ">> installing ndenv..."
anyenv install ndenv

### symbolic link
echo ">> symbolic link ~/.vimrc -> ${DOTFILES_ROOT}/.vimrc"
ln -s ${DOTFILES_ROOT}/.vimrc ~/.vimrc

echo ">> symbolic link ~/.gitconfig -> ${DOTFILES_ROOT}/.gitconfig"
ln -s ${DOTFILES_ROOT}/.gitconfig ~/.gitconfig

echo ">> symbolic link ~/.atom -> ${DOTFILES_ROOT}/.atom"
ln -s ${DOTFILES_ROOT}/.atom ~/.atom

echo ">> symbolic link /usr/local/share/git-core/contrib/diff-highlight/diff-highlight -> /usr/local/bin"
ln -s /usr/local/share/git-core/contrib/diff-highlight/diff-highlight /usr/local/bin

echo ">> symbolic link ~/.dotfiles/.iterm -> ~/iterm"
ln -s ~/.dotfiles/.iterm ~/iterm
