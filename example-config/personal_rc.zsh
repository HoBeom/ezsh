# This my personal zshrc configs. Feel free to use it and modify according to your needs
# Place all your .zshrc configurations (including this one) in a single or multiple files under ~/.config/ezsh/zshrc/ folder

# Additional OH-MY-ZSH plugins to enable
plugins+=(docker docker-compose pip screen zellij conda)

ZSH_ZELLIJ_PREFIX_Z=true

# Enable optional plugins only when the command exists.
if command -v pyenv >/dev/null 2>&1; then
    plugins+=(pyenv)
fi

if command -v tmux >/dev/null 2>&1; then
    plugins+=(tmux)
fi

# Remove OH-MY-ZSH plugins from the default config (example)
# plugins=(${plugins:#(zsh-autosuggestions|lol)})

# Example prompt customizations moved out of ezshrc.zsh.
# Keep personal prompt overrides here so upstream ezshrc.zsh updates can be merged cleanly.
# POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
# POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs ram load time)
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh context virtualenv nvm anaconda dir vcs)
# POWERLEVEL9K_ANACONDA_BACKGROUND=yellow
# POWERLEVEL9K_ANACONDA_SHOW_PYTHON_VERSION=false
# POWERLEVEL9K_ANACONDA_LEFT_DELIMITER=""
# POWERLEVEL9K_ANACONDA_RIGHT_DELIMITER=""
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Custom Aliases, add your personal aliases here

alias p="python"
alias ww="nvtop"
alias wd="watch -n 1 du -hs *"
alias nn="nmon"
alias gpu="gpustat -i"
alias tt="gnome-terminal --geometry 185x55"
alias mux="tmuxinator"
alias mon="tmuxinator start hwmonitor"

if (( $+commands[exa] )); then
  alias l='exa --icons -lbF --git'
  alias ll='exa --icons -lbGF --git'
  alias llm='exa --icons -lbGd --git --sort=modified'
  alias la='exa --icons -lbhHigUmuSa --time-style=long-iso --git --color-scale'
  alias lx='exa --icons -lbhHigUmuSa@ --time-style=long-iso --git --color-scale'
  alias lS='exa --icons -1'
  alias lt='exa --icons --tree --level=2'
fi

SECRETS_DIR="$HOME/.secrets"
if [[ -d "$SECRETS_DIR" ]]; then
  for f in "$SECRETS_DIR"/*.zsh(N); do
    [[ -r "$f" ]] && source "$f"
  done
fi

if [[ -x "$HOME/.config/ezsh/fzf/bin/fzf" ]]; then
  export PATH="$HOME/.config/ezsh/fzf/bin:$PATH"
fi

export FZF_CTRL_T_OPTS="
  --preview 'bat --style=numbers --color=always --line-range :500 {} 2>/dev/null || 
             tree -C {} | head -200'
  --preview-window=right:60%
"

if [ -x "$HOME/miniconda3/bin/conda" ]; then
    __conda_setup="$("$HOME/miniconda3/bin/conda" shell.zsh hook 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi

OPENCODE_BIN="$HOME/.opencode/bin"
if [[ -d "$OPENCODE_BIN" ]]; then
  path=("$OPENCODE_BIN" $path)
fi

export BUN_INSTALL="$HOME/.bun"
if [[ -d "$BUN_INSTALL/bin" ]]; then
  path=("$BUN_INSTALL/bin" $path)
fi

if [[ -s "$BUN_INSTALL/_bun" ]]; then
  source "$BUN_INSTALL/_bun"
fi

export PATH="$PATH:/opt/nvim/"

export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.nvm}"

if [[ -s "$NVM_DIR/nvm.sh" ]]; then
  if [[ -n "$SSH_CONNECTION" ]]; then
    # SSH: load immediately so node/npm/codex work in non-interactive commands
    source "$NVM_DIR/nvm.sh"
    nvm use default >/dev/null 2>&1
  else
    # Local: lazy load for fast shell startup
    _load_nvm() {
      source "$NVM_DIR/nvm.sh"
      nvm use default >/dev/null 2>&1
    }

    nvm() {
      unset -f nvm node npm npx
      _load_nvm
      nvm "$@"
    }

    node() {
      unset -f nvm node npm npx
      _load_nvm
      node "$@"
    }

    npm() {
      unset -f nvm node npm npx
      _load_nvm
      npm "$@"
    }

    npx() {
      unset -f nvm node npm npx
      _load_nvm
      npx "$@"
    }
  fi
fi
