# display colour codes
function colourmap() {
	for (( n=0; n < 256; n++ )) do
    		printf " [%d] $(tput setaf $n)%s$(tput sgr0)" $n "wMwMwMwMwMwMw
	"
	done
}

# auto-extract archive
function ex() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)      tar xjf $1      ;;
            *.tar.gz)       tar xzf $1      ;;
            *.bz2)          bunzip2 $1      ;;
            *.rar)          unrar x $1      ;;
            *.gz)           gunzip $1       ;;
            *.tar)          tar xf $1       ;;
            *.tbz2)         tar xjf $1      ;;
            *.tgz)          tar xzf $1      ;;
            *.zip)          unzip $1        ;;
            *.Z)            uncompress $1   ;;
            *.7z)           7z x $1         ;;
            *.deb)          ar x $1         ;;
            *.tar.xz)       tar xf $1       ;;
            *.tar.bzstz2)   unzstd $1       ;;
            *)  echo "'$1' cannot be extracted via ex" ;;
        esac
    else
        echo "'$1' is not a valid archive"
    fi
}

# cd utilities
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias home='cd ~'

# .bashrc utilities
alias nbash='nano ~/.bashrc'
alias sbash='source ~/.bashrc'

# ps utilities
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# colorize grep output (good for log files)
alias grep='grep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# set nano commands
alias ne="nano --linenumbers --mouse --indicator +99999999999999"
alias ns="nano --linenumbers --mouse --indicator"

# replace ls with exa
alias ls='exa --icons -F -H --group-directories-first -1 -a'
alias ll='ls -alF'

# replace history with atuin
alias history="atuin search -i --format '{time} - {command}' --inline-height 10"
alias historyl="atuin history list --format '{time} - {command}'"
alias historyld="atuin history list --format '{time} - {directory} - {command}'"

# startup starship
eval "$(starship init bash)"
source ~/.local/share/blesh/ble.sh

# startup atuin
export ATUIN_NOBIND="true"
[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash --disable-up-arrow --disable-ctrl-r)"