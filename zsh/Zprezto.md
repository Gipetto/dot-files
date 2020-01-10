# Setup Zprezto

```sh
brew install pandoc w3m source-highlight
brew tap caskroom/fonts
brew cask install font-meslo-nerd-font

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}"/.zprezto

# link out the standard files
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# link our customized files
ln -fs ~/Projects/shawn/dot-files/zsh/zshrc "${ZDOTDIR:-$HOME}"/.zshrc
ln -fs ~/Projects/shawn/dot-files/zsh/zpreztorc "${ZDOTDIR:-$HOME}"/.zpreztorc
pushd "${ZDOTDIR:-$HOME}"/.zprezto/modules/prompt/functions
ln -s ~/Projects/shawn/dot-files/zsh/prompt_shawn_setup prompt_shawn_setup
popd
```
