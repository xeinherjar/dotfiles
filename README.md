# Dotfiles

## OSX
-  Install [homebrew](http://brew.sh/)
-  Install ZSH `brew install zsh`
-  Edit /etc/shell to have an entry for the brew installed zsh
-  Set Z Shell to default shell `chsh -s /usr/local/bin/zsh`
-  Install [oh-my-zsh](http://ohmyz.sh/)
-  [Docker](https://download.docker.com/mac/stable/Docker.dmg)


## Alacritty
-  Install [Alacritty](https://github.com/jwilm/alacritty)
-  Install [Hack font](https://github.com/source-foundry/Hack)
  - `apt-get install fonts-hack`
```
ln -s ~/dotfiles/alacritty ~/.config/alacritty
```

## Vim or NeoVim
```
brew install vim
brew install neovim
```

### Add dot files and vim plugins
For Vim
```
cd ~
git clone git@github.com:xeinherjar/dotfiles.git
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
```

For NeoVim
```
mkdir -p ~/.config
ln -s ~/dotfiles/.vim .config/nvim
ln -s ~/dotfiles/.vimrc .config/nvim/init.vim
```

## zsh, oh-my-zsh, tmux
```
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/xeinherjar.zsh-theme ~/.oh-my-zsh/themes/xeinherjar.zsh-theme
```

Tell Git about global git ignore file
```
git config --global core.excludesfile ~/dotfiles/.gitignore_global
```

## Emacs?
Install Emacs, doom emacs
```
brew tap d12frosted/emacs-plus
brew install emacs-plus --without-spacemacs-icon
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications

ln -s ~/dotfiles/.doom.d ~/.doom.d
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

## Linux Applications
-  Install [PyEnv](https://github.com/pyenv/pyenv#installation)
  -  `git clone https://github.com/pyenv/pyenv.git ~/.pyenv`
-  Install [PyEnv-Virtualenv](https://github.com/pyenv/pyenv-virtualenv)
  -  `git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv`
-  Install [RustUp](https://rustup.rs/)
-  Ripgrep

## Scala needs that sweet sweet JVM, to bad java comes along
- Install [SDKMAN](https://sdkman.io/)
- `sdk list java`
- `sdk install java 11.0.7.hs-adpt`
- `sdk install sbt`
- `sdk install scala 2.12.11`
- [Metals](https://scalameta.org/metals/docs/editors/emacs.html)
  - ```
  curl -L -o coursier https://git.io/coursier-cli
  chmod +x coursier
  ./coursier bootstrap \
    --java-opt -Xss4m \
    --java-opt -Xms100m \
    --java-opt -Dmetals.client=emacs \
    org.scalameta:metals_2.12:0.8.4 \
    -r bintray:scalacenter/releases \
    -r sonatype:snapshots \
    -o ~/bin/metals-emacs -f
  ```
