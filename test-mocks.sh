# File is sourced for testing purposes only

# A mock emacs for testing, just prints the buffer contents
function _emacsfun
{
    emacs --batch --quick "$@" --eval '(princ (buffer-string))'
}
