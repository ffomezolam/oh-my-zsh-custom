# useful functions
newhtml () {
    [[ -z $EDITOR ]] && EDITOR=vim
    if [[ -e $1 ]] then
        print "$1 exists.  Not modifying.\n"
        $EDITOR $1
    else
        cat > $1 <<END
<!DOCTYPE html>

<!--[if lt IE 7]><html class="ie6"><![endif]-->
<!--[if IE 7]><html class="ie7"><![endif]-->
<!--[if IE 8]><html class="ie7"><![endif]-->
<!--[if gt IE 8]><!--><html><!--<![endif]-->
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width" />
        <title></title>
    </head>
    <body>
    </body>
</html>
END
        $EDITOR $1
    fi
}
