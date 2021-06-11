

Read from stdin to emacs
=========

A simple shell function to allow emacsclients (or emacs) to read from stdin via a temp file.

Tested with `zsh`, `bash` and `sh`. Everything should work with other modern shells (there's nothing fancy going on).

To use `emacs` rather than `emacsclient`, or to modify the command line args used, change the `_emacsstdin` and `_emacststdin` functions.


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

To read from stdin and open emacs in terminal mode

    echo "hello world" | e -t

Tests
------

Run the script `run-tests.sh` to test the function. Check in the script for the expected output to compare against (I should probably rewrite the tests in python or something so that the checking can be easily automated).
