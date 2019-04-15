# List (basic, all, directories)
alias ll='ls -lh'
alias la='ls -lah'
alias lsd='ls -lh | grep --color=never "^d"'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Jumps
alias code='cd ~/Code'
alias dotfiles='cd ~/.dotfiles'

# Miscellaneous getters
alias iplocal='ifconfig | sed -En "s/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p"'
