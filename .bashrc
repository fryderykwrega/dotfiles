parse_git_branch () {
    if git rev-parse --git-dir >/dev/null 2>&1
        then
            echo -en "\n\033[0;33m⠂\033[0;32m" $(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
            local STATUS=`git status 2>&1`
            if [[ "$STATUS" == *'Not a git repository'* ]]
                then echo -en "" # nothing
            else
                if [[ "$STATUS" != *'working tree clean'* ]]
                    then echo -en '\033[0;31m ⋌ not committed' # red if need to commit
            else
                if [[ "$STATUS" == *'Your branch is ahead'* ]]
                    then echo -en '\033[0;33m ⋌ not pushed' # yellow if need to push
                else
                    echo -en '\033[0;34m ⋌ clean' # else green
                fi
            fi

        fi
    fi
}

# terminal colors
export TERM=xterm-256color
export CLICOLOR=1

# history size
HISTSIZE=10000
HISTFILESIZE=10000

# cdpath alternations
CDPATH=.:$HOME:$HOME/WebDev

# custom prompt
export PS1='\n\[\e[0;33;49m\]⌜ \e[0;36;49m\]\u@\h\n\[\e[0;33;49m\]⠂\[\e[0;35;49m\] \w$(parse_git_branch) \[\e[0;33;49m\]\n⌞ \[\e[0;39;49m\]'

# alias replacing ls with exa (if exists)
if test -e /usr/local/bin/exa || test -e /usr/bin/exa; then
    alias ls='exa -aal --color=always --group-directories-first'
fi

# aliases
alias ..='cd ..'
alias tm='tmux attach || tmux new'
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias fdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias froute='sudo route -n flush'
alias gitlog='git log --oneline'
alias cdic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# brew sbin
export PATH="/usr/local/sbin:$PATH"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Added by n-install (see http://git.io/n-install-repo).
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Alacritty bash completion
[[ -r "~/.alacritty_bash_completion" ]] && source ~/.alacritty_bash_completion

# Run pfetch if exists
[[ -r "/usr/local/bin/pfetch" ]] && echo ""  && /usr/local/bin/pfetch

