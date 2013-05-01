# useful functions

# create js with umd header
newjsumd () {
    [[ -z $EDITOR ]] && EDITOR=vim
    if [[ -e $1 ]] then
        print "$1 exists.  Not modifying.\n" $EDITOR $1
    else
        cat > $1 <<END
/**
 * @module
 */
(function(name, context, definition) {
    if(typeof module !== 'undefined' && module.exports) module.exports = definition(/*require(deps)*/);
    else if(typeof define === 'function' && define.amd) define(/*[deps], */definition);
    else context[name] = definition();
})(/*'name'*/, this, function(/*deps*/) {

});
END
        $EDITOR $1
    fi
}

# create build.js for requirejs compiler
newrjsbuild () {
    [[ -z $EDITOR ]] && EDITOR=vim
    if [[ -e "build.js" ]] then
        print "build.js exists.  Not modifying.\n"
        $EDITOR "build.js"
    else
        cat > build.js <<END
({
    baseUrl: '.',
    name: 'main',
    out: 'main.build.js'
})
END
        $EDITOR "build.js"
    fi
}

# create yuidoc.json for yuidoc
newyuidoc () {
    [[ -z $EDITOR ]] && EDITOR=vim
    if [[ -e "yuidoc.json" ]] then
        print "yuidoc.json exists.  Not modifying.\n"
        $EDITOR "yuidoc.json"
    else
        cat > yuidoc.json <<END
{
    "name": "",
    "description": "",
    "version": "",
    "url": "",
    "options": {
        "outdir": "./doc",
        "exclude": "doc",
        "tabtospace": "4",
        "linkNatives": "true"
    }
}
END
        $EDITOR "yuidoc.json"
    fi
}
