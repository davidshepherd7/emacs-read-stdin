

Read from stdin to emacs
=========

A simple shell function to allow emacsclients (or emacs) to read from stdin via a temp file.

Tested with `zsh` and `bash`.

To use `emacs` rather than `emacsclient` change the `EMACSBIN` variable


Set up
----

Set up by sourcing the file `emacs-read-stdin.sh` in your `.bashrc` (or equivalent) with

    source /path/to/repo/emacs-read-stdin.sh

or by simply copying and pasting the two functions into `.bashrc`.

Usage
----

Read from stdin

    echo "hello world" | e -

or as normal from files

    e hello_world.txt
