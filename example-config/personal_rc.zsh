# This my personal zshrc configs. Feel free to use it and modify according to your needs
# Place all your .zshrc configurations (including this one) in a single or multiple files under ~/.config/ezsh/zshrc/ folder

# Additional OH-MY-ZSH plugins to enable
plugins+=(lol httpie docker docker-compose pyenv pip)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status command_execution_time background_jobs todo ram load rvm time)


# Custom Aliases, add your personal aliases here

alias p="python"
alias c="conda"
alias gg="google"
alias ww="watch -n 1 nvidia-smi"
alias wd="watch -n 1 du -hs *"
alias gpu="gpustat -i"
