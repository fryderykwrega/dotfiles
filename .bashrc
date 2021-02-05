parse_git_branch () {
    if git rev-parse --git-dir >/dev/null 2>&1
        then
          echo -en "\n\033[0;33m⠂\033[0;32m" $(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
            local STATUS=`git status 2>&1`
            if [[ "$STATUS" == *'Not a git repository'* ]]
                then echo -en "" # nothing
            else
                if [[ "$STATUS" != *'working tree clean'* ]]
                    then echo -en '\033[0;31m  not committed' # red if need to commit
            else
                if [[ "$STATUS" == *'Your branch is ahead'* ]]
                    then echo -en '\033[0;33m  not pushed' # yellow if need to push
                else
                    echo -en '\033[0;34m  repo clean' # else green
                fi
            fi

        fi
    fi
}

# custom prompt
export PS1='\n\[\e[0;33;49m\]⌜ \e[0;36;49m\]\u@\h\n\[\e[0;33;49m\]\[\e[0;35;49m\] \w$(parse_git_branch) \[\e[0;33;49m\]\n⌞ \[\e[0;39;49m\]'

# bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# cdpath alternations
CDPATH=.:$HOME:$HOME/WebDev

# brew sbin
export PATH="/usr/local/sbin:$PATH"

# run vscode from terminal
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# aliases
alias ..='cd ..'
alias tm='tmux attach || tmux new'
alias brewup='brew update; brew upgrade; brew cleanup; brew doctor'
alias fdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"
alias froute='sudo route -n flush'
alias gitlog='git log --oneline'
alias cdic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# alias replacing ls with exa (if exists)
if test -e /usr/local/bin/exa || test -e /usr/bin/exa || test -e ~/.cargo/bin/exa; then
    alias ls='exa -aal --color=always --group-directories-first'
fi

# pfetch
echo ""
echo ""
[[ -r "/usr/local/bin/pfetch" ]] && [[ $- =~ "i" ]] && echo ""  && /usr/local/bin/pfetch

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source "$HOME/.cargo/env"
