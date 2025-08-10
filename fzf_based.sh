# TODO - Improve our setup for FZF.
# However, this does work for now.
# Note: Seems different systems have different names for fd-find. Very cool.
# Just do ln -s $(which fdfind) ~/.local/bin/fd
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# FZF on current directory. Opens the file in neovim.
function fv {
    FILENAME="$(fzf --preview 'bat --theme=Coldark-Cold --style=numbers --color=always --line-range :500 {}')"
    if [ "$?" -ne 0 ]
    then
        return 1
    fi
    nvim "$FILENAME"
}

# FZF on current directory. Opens the file in neovim but with `e` support.
function efv {
    FILENAME="$(fzf --preview 'bat --theme=Coldark-Cold --style=numbers --color=always --line-range :500 {}')"
    if [ "$?" -ne 0 ]
    then
        return 1
    fi
    e "$FILENAME"
}

# FZF: Search for some line and open the file with that search criteria to the right line.
function fr {
    RGRES=$(rg --line-number --no-heading --color=always --smart-case "$@")
    if [ "$?" -ne 0 ]; then
        echo "Bad ripgrep result."
        return 1
    fi
    FZFRES=$(echo "$RGRES" | fzf -d ':' -n 2.. --ansi --no-sort --preview-window "down:20%:+{2}" --preview 'bat --theme=Coldark-Cold --style=numbers --color=always --highlight-line {2} {1}')
    if [ "$?" -ne 0 ]; then
        echo "Bad FZF result."
        return 1
    fi
    CUTRES=$(echo "$FZFRES" | cut -d: -f1-2)
    fn="${CUTRES%%:*}"
    ln="$(echo "${CUTRES}" | cut -d: -f2)"
    if [ ! -z "$fn" ]; then
        nvim +"${ln}" "$fn"
    else
        echo "Bad file result."
        return 1
    fi
}

# FZF: Search through history and print the result to the command line.
function fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# FZF: Search through a file, edit it with the correct line number.
function ff {
    FZFRES=$(bat --color=always --style=numbers "${1}" | fzf -d ':' +s --tac | grep -oE '^\s*[0-9]*' | tr -d ' ')
    if [ "$?" -ne 0 ]; then
        return 1
    fi
    if [[ "${FZFRES}" = "" ]]; then
        return 1
    fi
    nvim +"${FZFRES}" "${1}"
}

# FZF: Check out a branch.
function bfv {
    B="$(git branch --all | fzf | tr -d '[:space:]')"
    if [ $? -ne 0 ] || [ "$B" = "" ]; then
        return
    fi
    git checkout "$B"
}

# FZF: List directories and everything in them.
function fzf-ls {
    ls -d * | fzf --preview 'ls -la {}'
}

# FZF: Change directory with Z, but with FZF.
function fz {
    B="$(z | grep -o "/.*" | fzf)"
    if [ $? -ne 0 ] || [ "$B" = "" ]; then
        return
    fi
    cd "$B"
}
