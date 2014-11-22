# include this file in your .bashrc/.zshrc with source "emacs-pipe.sh"

# An emacs 'alias' with the ability to read from stdin
function e
{
    # Replace with `emacs` to not run as server/client
    EMACSBIN='emacsclient -c -n'

    # If the argument is - then write stdin to a tempfile and open the
    # tempfile. Otherwise just run emacsclient. -c and -n are just my
    # preferred options.
    if [[ $1 == - ]]; then
        tempfile=$(mktemp emacs-stdin-$USER.XXXXXXX --tmpdir)
        cat - > $tempfile
        $EMACSBIN -e "(progn (find-file \"$tempfile\")
                             (set-visited-file-name nil)
                             (rename-buffer \"*stdin*\" t))
                 " 2>&1 > /dev/null
    else
        $EMACSBIN "$@"
    fi
}
