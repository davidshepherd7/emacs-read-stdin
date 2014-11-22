

Read from stdin to emacs
=========

A simple shell function to allow emacsclients (or emacs) to read from stdin via a temp file.

Set up by sourcing the file `emacs-read-stdin.sh` in your `.bashrc` (or equivalent) with

    source /path/to/repo/emacs-read-stdin.sh

or by simply copying and pasting the two functions into `.bashrc`.

Tested with `zsh` and `bash`.

To use `emacs` rather than `emacsclient` replace `emacs_client_or_server` by `emacs`.
