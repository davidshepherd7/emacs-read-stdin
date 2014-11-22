# include this file in your .bashrc/.zshrc with source "emacs-pipe.sh"

# The emacs or emacsclient to use
function _emacsfun
{
    # Replace with `emacs` to not run as server/client
    emacsclient -c -n $@
}


# An emacs 'alias' with the ability to read from stdin
function e
{
    # If the argument is - then write stdin to a tempfile and open the
    # tempfile.
    if [[ $# -ge 1 ]] && [[ $1 == - ]]; then
        tempfile=$(mktemp emacs-stdin-$USER.XXXXXXX --tmpdir)
        cat - > $tempfile
        _emacsfun --eval "(progn (find-file \"$tempfile\")
                             (set-visited-file-name nil)
                             (rename-buffer \"*stdin*\" t))
                 " 2>&1 > /dev/null
    else
        _emacsfun "$@"
    fi
}
