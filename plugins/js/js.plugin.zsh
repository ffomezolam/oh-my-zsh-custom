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
    [[ ! -e $1 ]] && print  '/**'"\n"' * @module'"\n"' */'"\n"\
                            '(function(name, context, definition) {'\
                            "\t""if(typeof module !== 'undefined' && module.exports) module.exports = definition(require());"\
                            "\t""else if(typeof define === 'function' && define.amd) define([], definition);"\
                            "\t""else context[name] = definition();"\
                            "})('griddy', this, function(H) {"\
                            "});" > $1 && $EDITOR $1
}
