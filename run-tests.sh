#!/bin/bash

set -o errexit
set -o nounset

# Run script to test, should output something like

# test zsh pipe
# test bash pipe
# test zsh file
# test bash file

# Missing lines are failures


# command to load the function and the mock for _emacsfun
loadcmd=". $(pwd)/emacs-read-stdin.sh && . $(pwd)/test-mocks.sh"


function test_pipe
{
    shell="$1"
    shift
    $shell $@ -e -u -c "$loadcmd && echo test $shell pipe | e -"
}
test_pipe zsh -f 
test_pipe bash -norc


function test_file
{
    shell="$1"
    shift
    $shell $@ -e -u -c "$loadcmd && echo test $shell file > temp && e temp && rm temp"
}
test_file zsh -f
test_file bash -norc
