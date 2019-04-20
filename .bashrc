#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='\e[0;36m[ \A | \W ]\e[m\n-> '

if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi
# >>> Added by cnchi installer
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano

. "${HOME}/.cache/wal/colors.sh"


# --- ALIASES --- #

alias projects="cd ~/Desktop/projects"
alias pwn="cd ~/Desktop/projects/c_scripts/pwnablekr"

alias wiki="vim ~/vimwiki/index.md"
alias diary="vim ~/vimwiki/diary/diary.md"

export QT_QPA_PLATFORMTHEME=gtk2

alias php-xdebug="exec /home/comm/Desktop/scripts/php-xdebug.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias vpn="sudo openvpn /etc/openvpn/client/protonvpn.conf"
