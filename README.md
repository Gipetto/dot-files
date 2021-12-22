# Dot Files

This readme is almost always out of date...

## Fonts

Nerdfonts.

```sh
brew tap caskroom/fonts
brew cask install font-hasklig font-meslo-nerd-font
```

## Terminal

Import `MyNovel.terminal`.
Requires Nerdfonts install.

## RC files

For most files you'll just symlink a copy in to your home directory

```sh
ln -s /path/to/dot-files/vimrc ~/.vimrc
```

If your network environment isn't IPv6 friendly
``` sh
ln -s /path/to/dot-files/wgetrc ~/.wgetrc
ln -s /path/to/dot-files/curlrc ~/.curlrc
```

## Zsh

See the readme inside the `zsh` directory.

## Git

As of Git 1.7.10 the `.gitconfig` file has an `[include]` directive, so you can augment your local config with some shared config.

Simply add this to your global `~/.gitconfig`:

```ini
[include]
  path = /path/to/dot-files/git/gitconfig
```

## Vim

Plugins loaded with pathogen