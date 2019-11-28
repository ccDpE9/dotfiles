#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi
# >>> Added by cnchi installer
EDITOR=/usr/bin/nano

# --- Aliases

alias projects="cd ~/Desktop/projects"
alias wiki="vim ~/vimwiki/index.md"
alias diary="vim ~/vimwiki/diary/diary.md"
alias pomodoro=pomodoro_start

function pomodoro_start() {
  for i in {1..3}
  do
    notify-send "Session has started." && sleep 25m
    notify-send "5 minute break." && sleep 5m 
  done
    notify-send "Session has started." && sleep 25m
    notify-send "15 minute break." && sleep 15m
}


# --- NVM

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# --- PATHS

export NODE_PATH=/usr/lib/node_modules:$NODE_PATH


# --- Download  websites

function download_websites() {
  while read i;
  do wkhtmltopdf --javascript-delay 10 "$i" "$(echo "$i" | sed -e 's/htps\?:\/\///' -e 's/\//-/g' ).pdf";
  done < url-list.txt
}
