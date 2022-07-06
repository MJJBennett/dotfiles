VIM_SCRIPTS_LOCATION="$HOME/.vim/scripts"

mkdir -p "$VIM_SCRIPTS_LOCATION"
cp "$(dirname $0)/"aliases.vim "$VIM_SCRIPTS_LOCATION"
cp "$(dirname $0)/"e.vim "$VIM_SCRIPTS_LOCATION"
