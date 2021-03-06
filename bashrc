############################################
# .bashrc                                  #
# Junhyeok Ahn ( junhyeokahn91@gmail.com ) #
############################################

alias vi='vim'
if [ -n "$TMUX_PANE" ]; then
  # https://github.com/wellle/tmux-complete.vim
  fzf_tmux_words() {
    tmuxwords.rb --all --scroll 500 --min 5 | fzf-down --multi | paste -sd" " -
  }

  # ftpane - switch pane (@george-b)
  ftpane() {
    local panes current_window current_pane target target_window target_pane
    panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
    current_pane=$(tmux display-message -p '#I:#P')
    current_window=$(tmux display-message -p '#I')

    target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

    target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
    target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

    if [[ $current_window -eq $target_window ]]; then
      tmux select-pane -t ${target_window}.${target_pane}
    else
      tmux select-pane -t ${target_window}.${target_pane} &&
      tmux select-window -t $target_window
    fi
  }

  # Bind CTRL-X-CTRL-T to tmuxwords.sh
  bind '"\C-x\C-t": "$(fzf_tmux_words)\e\C-e\er"'

elif [ -d ~/dotfiles/iTerm2-Color-Schemes/ ]; then
  ~/dotfiles/iTerm2-Color-Schemes/tools/preview.rb ~/.vim/plugged/seoul256.vim/iterm2/seoul256.itermcolors
fi

ccmake() {
  CXX="$HOME/dotfiles/clang/cc_args.py clang++" cmake ..
}

function gpm() {
  git add -A
  git commit -a -m $1
  git push origin master
}

# Anaconda Virtual Env
#tf() {
  #source activate tensorflow
#}

sym() {
  source activate sym_walking
  export PYTHONPATH=/anaconda2/envs/sym_walking/lib/python3.6/site-packages:$PYTHONPATH
}

append_pwd() {
  export PYTHONPATH=${pwd}:$PYTHONPATH
}

myenv() {
  source activate myenv
  export PYTHONPATH=/anaconda2/envs/myenv/lib/python3.6/site-packages:$PYTHONPATH
}

dartenv() {
  source activate dartenv
}

deac() {
  source deactivate
}

baselines() {
    source activate baselines
}

make_video() {
    ffmpeg -r 60 -f image2 -s 1920x1080 -i image%06d.png -vcodec libx264 -crf 25  -pix_fmt yuv420p video.mp4
}

rl() {
    source activate rl
}

pybullet_env() {
    source activate pybullet_env
}

# Gurobi
export GUROBI_HOME="/Library/gurobi800/mac64"
export GRB_LICENSE_FILE=/Users/junhyeokahn/gurobi/gurobi.lic

# Mosek
export MOSEK_HOME="/Users/junhyeokahn/mosek/8/tools/platform/osx64x86"
export MOSEKLM_LICENSE_FILE=/Users/junhyeokahn/mosek/mosek.lic
export PATH=$PATH:/Users/junhyeokahn/mosek/8/tools/platform/osx64x86/bin
export DYLD_LIBRARY_PATH="/Users/junhyeokahn/mosek/8/tools/platform/osx64x86/bin":"$DYLD_LIBRARY_PATH"

export CLICOLOR=1;
export LSCOLORS=exfxcxdxbxegedabagacad;

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

## github/hub
if [ -f /path/to/hub.bash_completion ]; then
      . /path/to/hub.bash_completion
fi

## hochul
# fix error: ambiguous argument 'HEAD'
zgit_info_update() {
    zgit_info=()

    local gitdir=$(git rev-parse --git-dir 2>/dev/null)
    if [ $? -ne 0 ] || [ -z "$gitdir" ]; then
        return
    fi
}

# aliases
alias vv='vi ~/.vimrc'
alias vb='vi ~/.bashrc'
alias sb='source ~/.bashrc'
alias gs='git status'
alias gc='git clone'
alias gb='git branch'
alias gch='git checkout'
alias jp='jupyter notebook'
alias tf='source ~/envs/tensorflow/bin/activate'
alias dt='deactivate'
#alias tf='conda activate tensorflow'
alias pg='conda activate pygame'
alias de='conda deactivate'
alias py='python3'
alias tm='tmux'
alias ni='npm install'
alias ns='npm start'
alias run='./run.sh'
