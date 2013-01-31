# npm
alias npms='npm search'
alias npm='npm install'
alias npmg='sudo npm -g install'
alias npmi='npm info'
alias npmu='npm update'
alias npmgu='sudo npm -g update'

# useful functions
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
