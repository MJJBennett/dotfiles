## Vim / Terminal Configuration Files

### New Installation..?

`mkdir -p ~/.config && git clone <repo> ~/.config/`

### Installation

Running `install.sh` is simple but may move around pre-existing configurations. Best for setting up a new machine.

Otherwise, manually copying files as noted in `install.sh` will work fine. Use vim/install.sh to just install Vim. **This does not install init.vim at present.**

Before running Vim, install vim-plug:

```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

Now run `nvim`, then call `:PlugInstall`.

Note: There's a weird bug in the version we currently have to use of Catppuccin. Remove the print statements in:
`~/.vim/bundle/catppuccin/lua/lib/ui.lua`

More things to install:

#### Coc plugins

(Inside NeoVim)
```
:CocInstall coc-cmake
```

### Terminal / Shell Configuration

Use a package manager to install zsh (`sudo apt install zsh`, `brew install zsh`, etc)

Install oh-my-zsh via curl:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

Install Powerline fonts (for theme Agnoster):

```
git clone https://github.com/powerline/fonts
cd fonts
./install.sh
```
