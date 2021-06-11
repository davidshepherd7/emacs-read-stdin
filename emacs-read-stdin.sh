# include this file in your .bashrc/.zshrc with source "emacs-pipe.sh"

# The emacs or emacsclient to use
_emacsstdin()
{
    # Replace with `emacs` to not run as server/client
    emacsclient -c -n "$@"
}

# An emacs or emacsclient to use for only in terminal
_emacststdin()
{
    # Replace with `emacs` to not run as server/client
    emacsclient -t "$@"
}

# An emacs 'alias' with the ability to read from stdin
e()
{
    # If the argument is - then write stdin to a tempfile and open the
    # tempfile in emacs gui mode

    # If the argument is -t then write stdin to a tempfile and open the
    # tempfile in emacs terminal mode

    if [ $# -ge 1 ] && [ "$1" = - ]; then
        shift
        tempfile="$(mktemp "emacs-stdin-$USER.XXXXXXX" --tmpdir)"
        cat - > "$tempfile"
        _emacsstdin --eval "(find-file \"$tempfile\")" \
                  --eval '(set-visited-file-name nil)' \
                  --eval '(rename-buffer "*stdin*" t))'

    elif [ $# -ge 1 ] && [ "$1" = -t ]; then
        tempfile="$(mktemp "emacs-stdin-$USER.XXXXXXX" --tmpdir)"
        cat - > "$tempfile"
        _emacststdin --eval "(find-file \"$tempfile\")" \
                  --eval '(set-visited-file-name nil)' \
                  --eval '(rename-buffer "*stdin*" t))' \
                  "$@"
    else
        _emacsstdin "$@"
    fi
}
