### vars
DOTFILES_ROOT=~/.dotfiles

### dotfiles
git clone git@github.com:hypo9eal/.dotfiles.git ${DOTFILES_ROOT} --recursive

ln -s ${DOTFILES_ROOT}/.atom ~/.atom
ln -s ${DOTFILES_ROOT}/.vimrc ~/.vimrc
ln -s ${DOTFILES_ROOT}/.gitconfig ~/.gitconfig

### zprezto
zsh

setopt EXTENDED_GLOB
for rcfile in ${DOTFILES_ROOT}/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

ln -s ${DOTFILES_ROOT}/.zprezto ~/.zprezto

mv ~/.zprofile ~/.zprofile.bk
ln -s ${DOTFILES_ROOT}/.zprofile ~/.zprofile

chsh -s /bin/zsh

### env
cat << EOS >> ~/.zprofile

# homebrew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# anyenv
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/var/anyenv/bin
export ANYENV_ROOT=/usr/local/var/anyenv/
eval ""

#ndenv
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/var/anyenv/envs/ndenv/shims/npm

# nodebrew
#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/var/nodebrew/current/bin
#export NODEBREW_ROOT=/usr/local/var/nodebrew
EOS
