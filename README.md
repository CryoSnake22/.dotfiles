## Steps to bootstrap

1. Install Apple's command line tools

```shell
xcode-select --install
```

2. clone repo into new hidden repository

```shell
# Use SSH (if set up)...
git clone git@github.com:eieioxyz/Beyond-Dotfiles-in-100-Seconds.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/eieioxyz/Beyond-Dotfiles-in-100-Seconds.git ~/.dotfiles
```

3. create symlinks with the `ln -s <file> <location of the symlink>`
   Typically this can be done through a bootstrap.sh file which you can run with the `sh ./bootstrap.sh` command (if you're in the directory containing the script)

4. install homebrew

```shell
# These could also be in an install script.

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Then pass in the Brewfile location...
brew bundle --file ~/.dotfiles/Brewfile

# ...or move to the directory first.
cd ~/.dotfiles && brew bundle
```

Huge props to fireship's video entitled "Beyond Dotfiles in 100 seconds" from which this README file was heavily inspired.
Github repo this was inspired from: https://github.com/eieioxyz/Beyond-Dotfiles-in-100-Seconds
