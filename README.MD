# Dotfiles

## Base

### MacOS
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/einherjar/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### Linux
```sh
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install build-essential git curl alacritty ripgrep
sudo apt-get install neovim tmux
```

## Fonts
### MacOS
```sh
brew tap homebrew/cask-fonts
brew install font-monaspace

### Linux
```sh
mkdir ~/.fonts
curl .. https://github.com/githubnext/monaspace/releases
cp ~/...*.otf ~/.fonts
fc-cache -f -v
```

## Tools
```sh
git config --global init.defaultBranch master
git config --global core.excludesfile ~/dotfiles/.gitignore_global
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

### JJ
```sh
brew install jj

$ jj config set --user user.name "Your Name"
$ jj config set --user user.email "you@example.com"
```

## SSH
- insert security key
```sh
ssh-keygen -t ed25519-sk -C "email@email.net"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_sk
```

## Zsh
Don't take .zprofile, too machine specific most of the time
```sh
chsh -s /usr/bin/zsh
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

## Tmux
```sh
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
```

## Bazel
```sh
brew install bazelisk
```
## Zed
```sh
ln -s ~/dotfiles/zed/settings.json ~/.config/zed/settings.json
ln -s ~/dotfiles/zed/keymap.json ~/.config/zed/keymap.json
```

## Emacs
```sh
brew tap d12frosted/emacs-plus
brew install emacs-plus
brew install ispell
brew install fd
brew services start d12frosted/emacs-plus/emacs-plus@30
ln -sf ~/dotfiles/doom ~/.config/doom
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync
osascript -e 'tell application "Finder" to make alias file to posix file "/opt/homebrew/opt/emacs-plus@30/Emacs.app" at posix file "/Applications" with properties {name:"Emacs.app"}'
```

Nerd Font `M-x nerd-icons-install-fonts`

## NeoVIM
### MacOS
```sh
brew install neovim
```

### Linux
```sh
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim
```

### Layout
- init.lua    -- entrypoint
- lua/        -- modules for init.lua to load
- lua/plugins -- modules for init.lua to load

## Languages
### Common Lisp
```sh
brew install sbcl
```

### Clojure
```sh
sudo apt-get install rlwrap
curl -L -O https://github.com/clojure/brew-install/releases/latest/download/posix-install.sh
chmod +x posix-install.sh
sudo ./posix-install.sh
```

### Elixir
```
brew install elixir
curl -o els.zip -fL $(curl https://api.github.com/repos/elixir-lsp/elixir-ls/releases/latest | jq -r '.assets[0].browser_download_url')
unzip els.zip -d software/elixir-ls
rm els.zip
```

### Scala
Install Coursier, have it manage the JVM


#### MacOS
- at time of writing the one from brew doesn't work with M series chips
```sh
$ curl -fL https://github.com/VirtusLab/coursier-m1/releases/latest/download/cs-aarch64-apple-darwin.gz | gzip -d > cs
./cs setup
```

#### Linux
```sh
curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs
chmod +x cs
./cs setup --yes
rm -f ./cs
```

### JVM
`cs java --jvm 21 --setup`
- Sets `JAVA_HOME` to use 21 and install it, env is set in .zprofile
- If you need one off for a project `eval "$(cs java --jvm 14 --env)"` to set for that shell

### Golang
```
brew install go
go install golang.org/x/tools/gopls@latest
brew install tree-sitter-cli # no idea why nvim-treesitter needs this
```


#### Lua
```sh
brew install lua-language-server
```

### Node / JavaScript
```sh
brew install fnm
fnm install v21.6.1 # or whatever version
```

### Python
```
curl -LsSf https://astral.sh/uv/install.sh | sh
# or
brew install uv
```

LSP
```sh
# Install
uv tool install ty@latest
# Update
uv tool upgrade ty
```

### Rust
```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-src
rustup component add rust-analyzer
rustup component add clippy
rustup component add rustfmt
```

### Haskell
```sh
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
sudo apt-get install libgmp3-dev
```

### Zig
```sh
curl https://ziglang.org/download/index.json | jq '.master["aarch64-macos"].tarball'
curl -Lv OUTPUT -o zig.tar.xz
tar -xf zig.tar.xz
mv zig.. ~/software
ln -s ~/software/zig/zig ~/.local/bin/zig
```
Follow https://zigtools.org/zls/install/
currently installing to ~/software/zls
```
ln -s ~/software/zls/zig-out/bin/zls ~/.local/bin/zls
```


## Software
### Ghostty
```sh
sudo apt install libgtk-4-dev
sudo apt install libadwaita-1-dev
git clone git@github.com:mitchellh/ghostty.git
zig build -p $HOME/.local -Doptimize=ReleaseFast
ln -s ~/dotfiles/ghostty ~/.config/ghostty
```

### Firefox Nightly
```sh
curl -Lv "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US" -o firefox-nightly.tar.bz2 
tar -xvf firefox-nightly.tar.bz2
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
