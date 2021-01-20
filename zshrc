HIST_STAMPS="yyyy-mm-dd"
alias b='c -'
alias l='pwd;ls -rlta --time-style="+%Y-%m-%d $newline%m-%d %H:%M" --color'
alias g='grep'
alias m='less'
alias t='less -E -F'
alias e='emacsclient -nw -c -a='
alias p='pwd'
alias u='cd ..;l'
alias a='alias'
alias f='find . -name'
alias h='history|m'
alias i='info'

alias ps='ps -ef'
alias mk='mkdir'
alias wh='which'
alias mr='less -r'
alias du='du --max-depth=1 -x|sort -t"." -k1 -n'
alias cp='cp -i'
alias mv='mv -i'
alias tx='tar xfvz'
alias tc='tar cfvz'
alias co='colordiff'

alias ut='export LANG=zh_CN.UTF-8 && export LC_ALL=zh_CN.UTF-8'
alias gb='export LANG=zh_CN.GBK && export LC_ALL=zh_CN.GBK'
alias en='export LANG=en_US && export LC_ALL=en_US'

alias gg='git status'
alias gp='git pull'


alias sc='screen -h 400000 -S pc'
alias sr='screen -r -h 400000 -d pc'


alias cv='iconv -c -f utf8 -t gbk'
alias cvg='iconv -c -f gbk -t utf8'

alias dk='docker'
alias kc='docker-compose'

alias mos='LC_CTYPE=en_US.UTF-8 LC_ALL=en_US.UTF-8 mosh'

function c {
  cd $1; l
}

function scc {
  screen -h 40000 -S $1
    
}

function scr {
  screen -r -d $1
}

## History wrapper
function omz_history {
  # Delete the history file if `-c' argument provided.
  # This won't affect the `history' command output until the next login.
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    echo >&2 History file deleted. Reload the session to see its effects.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # otherwise, call `fc -l 1` to show all available
    # history (and pass additional parameters)
    builtin fc "$@" -l 1
  fi
}

# Timestamp format
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='omz_history -f' ;;
  "dd.mm.yyyy") alias history='omz_history -E' ;;
  "yyyy-mm-dd") alias history='omz_history -i' ;;
  *) alias history='omz_history' ;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000000
SAVEHIST=1000000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

source ~/.va
