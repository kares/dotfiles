
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

source ~/.bash/cdargs 

if [ -s $HOME/.rvm/scripts/rvm ]; then 
    source $HOME/.rvm/scripts/rvm 
fi # and @see .bash/paths

#if [ -f ~/.bashrc ]; then
#  . ~/.bashrc
#fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

