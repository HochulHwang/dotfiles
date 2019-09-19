. ~/.bashrc
. ~/.bash_prompt

# added by Anaconda2 5.1.0 installer
export PATH="/anaconda2/bin:$PATH"
# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!


# homebrew completion
if type brew &>/dev/null; then
  for COMPLETION in $(brew --prefix)/etc/bash_completion.d/*
  do
    [[ -f $COMPLETION ]] && source "$COMPLETION"
  done
  if [[ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]];
  then
    source "$(brew --prefix)/etc/profile.d/bash_completion.sh"
  fi
fi

# hub
if [ -f /path/to/hub.bash_completion ]; then
      . /path/to/hub.bash_completion
fi
# alias
eval "$(hub alias -s)"




__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/hochul/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/hochul/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/hochul/miniconda3/etc/profile.d/conda.sh"
        #CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/hochul/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
