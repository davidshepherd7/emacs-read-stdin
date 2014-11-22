# include this file in your .bashrc/.zshrc with source "emacs-pipe.sh"


# Intelligently run emacsclient, and run server if needed. This preserves
# all command line args, which doesn't happen if we allow emacsclient to
# create the server itself (by setting -a '').
function emacs_client_or_server
{
    emacsclient -c -n "$@" -a 'false' || \
        (\emacs --daemon && emacsclient -c -n "$@")
}

# Emacsclient with ability to read from piped stdin.
function e
{
    # If the argument is - then write stdin to a tempfile and open the
    # tempfile. Otherwise just run emacsclient. -c and -n are just my
    # preferred options.
    if [[ $1 == - ]]; then
        tempfile=$(mktemp emacs-stdin-$USER.XXXXXXX --tmpdir)
        cat - > $tempfile
        emacs_client_or_server -e "(progn (find-file \"$tempfile\")
                                                    (set-visited-file-name nil)
                                                    (rename-buffer \"*stdin*\"))
                                             " 2>&1 > /dev/null
    else
        emacs_client_or_server "$@"
    fi
}
