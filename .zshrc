# --- ENV

export LANG=/usr/lib/locale/en_GB
export BROWSER=/usr/bin/firefox
export EDITOR="vim"

# --- Aliases

alias projects="cd ~/Desktop/projects"
alias wiki="vim ~/vimwiki/index.md"
alias diary="vim ~/vimwiki/diary/diary.md"
alias vpn="sudo openvpn /etc/openvpn/client/protonvpn.conf"


# --- Prompt

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b'

setopt PROMPT_SUBST
PROMPT='[ %n | ${PWD/#$HOME/~} ] ${vcs_info_msg_0_} > '


# --- Pywal

[[ -f ~/.cache/wal/sequences ]] && (cat ~/.cache/wal/sequences &)
