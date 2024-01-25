alias macmake="cmake .. -DCMAKE_CXX_COMPILER=/usr/local/bin/g++ -DCMAKE_C_COMPILER=/usr/local/bin/gcc-8"
alias macmakecc="macmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

# These require a path to be passed
alias cmake-gcc="cmake -DCMAKE_CXX_COMPILER=/usr/local/bin/g++ -DCMAKE_C_COMPILER=/usr/local/bin/gcc-8"
alias cmake-gcc-cc="cmake-gcc -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

alias ccmake="cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

alias fcb="ccmake && make all && ctest --verbose"

# Better make
# Lol I don't know what is going on but I cannot get this to work. (Like, the if statement)
##if [ "$(uname)" == "Darwin" ]; then
#    # lol
#    alias mk="make -j2"
#else
#    alias mk="make -j$(nproc)"
#fi
# this immediately calls nproc and that doesn't exist on my macbook sooooo goodbye
# alias mk="make -j$(nproc)"

# Rust Aliases
alias cardoc="cargo doc --open --package "
alias rusdoc="rustup doc"

alias la="ls -la"
alias lac="ls -la -I \"*.ignore\" -I \".clang-format\" -I \".git\" -I \".idea\" -I \"__pycache__\" -I \".git\" -I \".git\" -I \".git\""
alias usage="du -h -d1"
alias ze="vim ~/.zshrc"

alias nv="nvim"
alias vim="echo LOL"

# This only works with gitify somewhere in the path
function gch {
    git clone $(gitify -p "$1") $2; 
}

# Writing aliases
alias cw="wc -w *.md"
alias cwt="cw | egrep '([0-9]+) *total' | egrep -o '[0-9]+'"

# Mac aliases
alias mac-psc="log show --predicate 'eventMessage contains \"Previous shutdown cause\"' --last 24h"
alias mac-upt="sudo sntp -sS time.apple.com"

function replace {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        rg "$1" --files-with-matches | xargs sed -i "s/$1/$2/g"
    fi
}

### Very useful tools
### Can also make nicer aliases with:
### alias rg="rgc"
### alias re="rge"
function rgc() {
    echo "$1" > "${XDG_CACHE_HOME:-$HOME/.cache}/.rgt-last"
    rg "$1"
}

function rge() {
    # TODO - Must add helper.py, lol.
    # Ideally we just make it a bash script instead..
    if [[ -f helper.py ]]; then
        rg $(cat "${XDG_CACHE_HOME:-$HOME/.cache}/.rgt-last") > "${XDG_CACHE_HOME:-$HOME/.cache}/.rgt-results"
        last_file=$(./helper.py --main --rge "$1")
        if [ $? -eq 0 ]; then
            nv "$last_file"
        else
            echo "$last_file"
        fi
    fi
}

# Second attempt at these. The originals were a bit overspecialized.
# This is technically really slow. Ideally we would steal the output and parse it while throwing it into a file.
# That's probably the next thing to do.
function rgc2() {
    rg "$@" --files-with-matches > "${XDG_CACHE_HOME:-$HOME/.cache}/.rg-results"
    rg "$@"
}

function rge2() {
    # TODO - Must add rge.py, lol.
    # Ideally we just make it a bash script instead..
    if [[ -f rge.py ]]; then
        last_file=$(./rge.py "${XDG_CACHE_HOME:-$HOME/.cache}/.rg-results")
        if [ $? -eq 0 ]; then
            nv "$last_file"
        else
            echo "$last_file"
        fi
    fi
}
###

#### BEGIN
# Aliases imported from ~/.bash_aliases on mac
alias la="ls -la"
alias af="git add ."
alias afc="git add . && git commit -m"
alias afa="git add . && git commit --amend"

alias p="git push"
alias gp="git push"
alias pu="git push -u origin HEAD"
alias gpu="git push -u origin HEAD"

alias gc="git commit -m"

alias gri="git rebase -i"

alias s="git status"
alias gs="git status"

alias l="git log"
# alias gl="git log"

alias dif="git diff"

alias whi="whence -vf"

# alias vm="vim ~/.bash_aliases"
# alias sm=". ~/.bash_aliases"
# alias cm="cat ~/.bash_aliases"

# alias scrabble="cd ~/programming/scratch/scrabble/ && python3 scrabble.py"
#### END

# TODO - Improve our setup for FZF.
# However, this does work for now.
# Note: Seems different systems have different names for fd-find. Very cool.
# Just do ln -s $(which fdfind) ~/.local/bin/fd
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

function fv {
    FILENAME="$(fzf --preview 'bat --theme=Coldark-Cold --style=numbers --color=always --line-range :500 {}')"
    if [ "$?" -ne 0 ]
    then
        return 1
    fi
    nvim "$FILENAME"
}

function efv {
    FILENAME="$(fzf --preview 'bat --theme=Coldark-Cold --style=numbers --color=always --line-range :500 {}')"
    if [ "$?" -ne 0 ]
    then
        return 1
    fi
    e "$FILENAME"
}

function fr {
    RGRES=$(rg --line-number --no-heading --color=always --smart-case "$@")
    if [ "$?" -ne 0 ]; then
        echo "Bad ripgrep result."
        return 1
    fi
}
