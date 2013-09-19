
source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

source ~/.bash/cdargs
source ~/.bash/copy

if [ -s "$HOME/.rvmrc" ]; then
    source "$HOME/.rvmrc"
fi

#source ~/.profile

# to have $rvm_path defined if set
[[ -s "${rvm_path-$HOME/.rvm}/scripts/rvm" ]] && . "${rvm_path-$HOME/.rvm}/scripts/rvm"
# and @see .bash/paths

#if [ -f ~/.bashrc ]; then
#  . ~/.bashrc
#fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

