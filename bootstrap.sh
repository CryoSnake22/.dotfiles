# This creates the symlinks for all the config files
ln -s ~/.dotfiles/.config ~/.config
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.npm ~/.npm
ln -s ~/.dotfiles/Iterm/ ~/Home/Coding/

# This installs homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# This uses the "Brewfile" which is obtained by using the command `brew bundle dump
# --describe` in order to reinstall all the brew packages.
brew bundle --file ~/.dotfiles/Brewfile

defaults write com.apple.dock autohide-delay -float 0
killall Dock
