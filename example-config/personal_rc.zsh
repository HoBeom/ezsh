# This my personal zshrc configs. Feel free to use it and modify according to your needs
# Place all your .zshrc configurations (including this one) in a single or multiple files under ~/.config/ezsh/zshrc/ folder

# Additional OH-MY-ZSH plugins to enable
plugins+=(zsh-completions docker docker-compose pyenv pip tmux screen)

# Remove OH-MY-ZSH plugins from the default config (example)
# plugins=(${plugins:#(zsh-autosuggestions|lol)})

# Example prompt customizations moved out of ezshrc.zsh.
# Keep personal prompt overrides here so upstream ezshrc.zsh updates can be merged cleanly.
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs ram load time)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh context anaconda dir vcs)
POWERLEVEL9K_ANACONDA_BACKGROUND=yellow
POWERLEVEL9K_ANACONDA_SHOW_PYTHON_VERSION=false
POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=""
POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=""
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

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
