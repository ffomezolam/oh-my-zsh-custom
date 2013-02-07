# useful functions
newhtml () {
    [[ -z $EDITOR ]] && EDITOR=vim
    [[ -e $1 ]] && print "$1 exists.  Not modifying.\n" && $EDITOR $1
    [[ ! -e $1 ]] && print "<!DOCTYPE html>\n"\
"\n<html>"\
"\n    <head>"\
"\n        <title></title>"\
"\n    </head>"\
"\n    <body>"\
"\n    </body>"\
"\n</html>" > $1 && $EDITOR $1
}
