autoload -Uz compinit promptinit
compinit
promptinit

NEWLINE=$'\n'
PS1="%n@%m %/$NEWLINE$ "
