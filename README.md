# Fred's configuration dotfiles for Mac OS X / Ubuntu

### pull dotfiles
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
echo ".cfg" >> .gitignore
git clone --bare https://github.com/fryderykwrega/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

config checkout

config config --local status.showUntrackedFiles no
```

Source: [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
