# This my personal zshrc configs. Feel free to use it and modify according to your needs
# Place all your .zshrc configurations (including this one) in a single or multiple files under ~/.config/ezsh/zshrc/ folder

# Additional OH-MY-ZSH plugins to enable
plugins+=(zsh-autosuggestions docker docker-compose pyenv pip tmux)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status command_execution_time background_jobs todo ram load rvm time)


# Custom Aliases, add your personal aliases here

alias p="python"
alias c="conda"
alias ww="nvtop"
alias wd="watch -n 1 du -hs *"
alias nn="nmon"
alias gpu="gpustat -i"
alias tt="gnome-terminal --geometry 185x55"
alias mux="tmuxinator"
alias mon="tmuxinator start hwmonitor"