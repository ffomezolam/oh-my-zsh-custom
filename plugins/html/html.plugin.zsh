# useful functions
newhtml () {
    [[ -z $EDITOR ]] && EDITOR=vim
    if [[ -e $1 ]] then
        print "$1 exists.  Not modifying.\n"
        $EDITOR $1
    else
        cat > $1 <<END
<!DOCTYPE html>

<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--><html class="no-js"><!--<![endif]-->
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge"
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
    </head>
    <body>
    </body>
</html>
END
        $EDITOR $1
    fi
}
