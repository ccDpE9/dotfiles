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
alias diary="vim ~/vimwiki/diary/index."

function diary() {
  DATE="$(date +"%m-%d-%y")"
  FILENAME="${DATE}.md"

  if [ ! -f "/home/comm/Desktop/diaries/${FILENAME}" ] 
  then
    touch "/home/comm/Desktop/diaries/${FILENAME}"
    printf "#### ${DATE}\n----" >> "/home/comm/Desktop/diaries/${FILENAME}"
    # @TODO: Update the index file
  fi

  vim "/home/comm/Desktop/diaries/${FILENAME}"
}

# --- NVM

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
