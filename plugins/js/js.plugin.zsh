# useful functions

# create js with umd header
newjsumd () {
    [[ -z $EDITOR ]] && EDITOR=vim
    [[ -e $1 ]] && print "$1 exists.  Not modifying.\n" && $EDITOR $1
    [[ ! -e $1 ]] && print "/**"\
        "\n * @module"\
        "\n */"\
        "\n(function(name, context, definition) {"\
        "\n    if(typeof module !== 'undefined' && module.exports) module.exports = definition(/*require(deps)*/);"\
        "\n    else if(typeof define === 'function' && define.amd) define(/*[deps], */definition);"\
        "\n    else context[name] = definition();"\
        "\n})(/*'name'*/, this, function(/*deps*/) {"\
        "\n"\
        "\n});" > $1 && $EDITOR $1
}

# create build.js for requirejs compiler
newrjsbuild () {
    [[ -z $EDITOR ]] && EDITOR=vim
    [[ -e "build.js" ]] && print "build.js exists.  Not modifying.\n" && $EDITOR "build.js"
    [[ ! -e "build.js" ]] && print "({"\
        "\n    baseUrl: '.',"\
        "\n    name: 'main',"\
        "\n    out: 'main.build.js'"\
        "\n})" > "build.js" && $EDITOR "build.js"
}

# create yuidoc.json for yuidoc
newyuidoc () {
    [[ -z $EDITOR ]] && EDITOR=vim
    [[ -e "yuidoc.json" ]] && print "yuidoc.json exists.  Not modifying.\n" && $EDITOR "yuidoc.json"
    [[ ! -e "yuidoc.json" ]] && print "{"\
        "\n\t"'"name": "",'\
        "\n\t"'"description": "",'\
        "\n\t"'"version": "",'\
        "\n\t"'"url": "",'\
        "\n\t"'"options": {'\
        "\n\t\t"'"outdir": "./doc"'\
        "\n\t"'}'\
        "\n"'}' > "yuidoc.json"
}
