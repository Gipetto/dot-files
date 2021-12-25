# Zprezto

## Install

``` sh
brew install pandoc w3m source-highlight
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# link out the standard files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
```

&rarr; [Full Install Docs](https://github.com/sorin-ionescu/prezto#installation)

## Setup

```sh
# link our customized files
pushd "$HOME"
ln -fs ~/Projects/dot-files/zsh/zshrc .zshrc
ln -fs ~/Projects/dot-files/zsh/zpreztorc .zpreztorc
ln -fs ~/Projects/dot-files/zsh/zprofile .zprofile
pushd .zprezto/modules/prompt/functions
ln -fs ~/Projects/dot-files/zsh/prompt_shawn_setup prompt_shawn_setup
popd
popd
```

## Updating

``` sh
cd $ZPREZTODIR
git pull
git submodule sync --recursive
git submodule update --init --recursive
```
