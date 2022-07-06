function ef {
    if [[ $1 = "" ]]; then
        echo "Please provide arguments for fdfind :)"
        return
    fi

    FD_PROG=fd
    [ -x /usr/bin/fd ] || FD_PROG=fdfind

    PROG=e
    if [[ $1 = "show" ]]; then
        shift
        PROG=echo
    fi
    # Edit the CC file
    if [[ $1 =~ ^c+$ ]]; then
        LEXT="$1"
        shift
        $PROG "$($HOME/programming/install/best_match.py $LEXT $($FD_PROG "$@"))"
    elif [[ $1 =~ ^h+$ ]]; then
        LEXT="$1"
        shift
        $PROG "$($HOME/programming/install/best_match.py $LEXT $($FD_PROG "$@"))"
    else
        $PROG "$($HOME/programming/install/best_match.py $($FD_PROG "$@"))"
    fi
}
