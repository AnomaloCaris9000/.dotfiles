autoload -Uz compinit promptinit
promptinit

NEWLINE=$'\n'
PS1="> -- %n@%m %/$NEWLINE$ "

compinit
