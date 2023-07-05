# Dotfiles
#
## Base
```sh
sudo apt install build-essential git curl alacritty 
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

## Tools
```sh
git config --global init.defaultBranch master
git config --global core.excludesfile ~/dotfiles/.gitignore_global
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```
## SSH
- insert security key
```sh
ssh-keygen -t ed25519-sk -C "email@email.net"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_sk
```


## Zsh
```sh
chsh -s /usr/bin/zsh
```
~/.zshrc
~/.zprofile

## NeoVIM
```sh
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

# install packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

## Languages

### Scala
Install Coursier, have it manage the JVM
```sh
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs
chmod +x cs
./cs setup --yes
rm -f ./cs
```

### Python
### Rust
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```


## Software
### Firefox Nightly
```sh
curl -Lv "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US" -o firefox-nightly.tar.bz2 
tar xvf firefox-nightly.tar.bz2
sudo mv firefox /opt/firefox-nightly
sudo ln -s /opt/firefox-nightly/firefox /usr/local/bin/firefox-nightly
cat << EOF >> ~/.local/share/applications/firefox-nightly.desktop
[Desktop Entry]
Name=Firefox Nightly
Comment=Web Browser
Exec=/opt/firefox-nightly/firefox %u
Terminal=false
Type=Application
Icon=/opt/firefox-nightly/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
EOF
sudo update-desktop-database
```

### Add dot files and vim plugins
Tell Git about global git ignore file
```
git config --global core.excludesfile ~/dotfiles/.gitignore_global
```
