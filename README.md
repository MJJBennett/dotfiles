## Vim / Terminal Configuration Files

### Installation

Running `install.sh` is simple but may nuke pre-existing configurations. Best for setting up a new machine.

Otherwise, manually copying files as noted in `install.sh` will work fine.

Before running Vim, install vundle:

```
mkdir -p ~/.vim/bundle/ 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Now run `vim`, then call `:PluginInstall`.

Finally, compile YouCompleteMe: `cd ~/.vim/bundle/YouCompleteMe/ && ./install.py --clang-completer` (may need to install `python-dev` via `apt-get` beforehand)

### Terminal / Shell Configuration

Use a package manager to install zsh (`sudo apt-get install zsh`, `brew install zsh`, etc)

Install oh-my-zsh via curl:

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

Install Powerline fonts (for theme Agnoster):

```
git clone https://github.com/powerline/fonts
cd fonts
./install.sh
```
