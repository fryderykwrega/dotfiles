# Fred's configuration dotfiles for Mac OS X / Ubuntu

### oh-my-zsh
Install from https://github.com/ohmyzsh/ohmyzsh

### zsh spaceship prompt
Install from https://github.com/denysdovhan/spaceship-prompt#installing

### spacevim
Install from https://github.com/SpaceVim/SpaceVim

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
