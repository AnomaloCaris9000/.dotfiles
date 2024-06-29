autoload -Uz compinit vcs_info
precmd () { vcs_info } # always load before displaying the prompt
zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)' # git(main)

NEWLINE=$'\n'
PS1=">>  %F{red}%n%f@%F{blue}%m%f %/ $vcs_info_msg_0_ $NEWLINE$ "

compinit
