# ----------------------------------------
# Homebrew (Apple Silicon)
# ----------------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# ----------------------------------------
# PATH Configuration
# ----------------------------------------
export PATH="$HOME/.local/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
export PATH="$HOME/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ----------------------------------------
# nvm (Node Version Manager)
# ----------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # Load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # Load nvm bash_completion

# ----------------------------------------
# Shell Options
# ----------------------------------------
setopt AUTO_CD              # cd by typing directory name
setopt HIST_IGNORE_DUPS     # Don't record duplicates in history
setopt SHARE_HISTORY        # Share history between sessions
setopt APPEND_HISTORY       # Append to history file
setopt INC_APPEND_HISTORY   # Add commands as they are typed
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# ----------------------------------------
# Completion
# ----------------------------------------
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case-insensitive completion

# ----------------------------------------
# Aliases
# ----------------------------------------
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

# ----------------------------------------
# bun completions
# ----------------------------------------
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
source $(brew --prefix)/opt/spaceship/spaceship.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----------------------------------------
# Spaceship Git Status Colors
# All symbols and brackets: yellow
# Hide section when no changes
# ----------------------------------------

# Color the brackets yellow (with leading space)
SPACESHIP_GIT_STATUS_PREFIX=" %F{yellow}[%f"
SPACESHIP_GIT_STATUS_SUFFIX="%F{yellow}]%f"

# Make all status symbols yellow
SPACESHIP_GIT_STATUS_UNTRACKED="%F{yellow}?%f"
SPACESHIP_GIT_STATUS_ADDED="%F{yellow}+%f"
SPACESHIP_GIT_STATUS_MODIFIED="%F{yellow}!%f"
SPACESHIP_GIT_STATUS_RENAMED="%F{yellow}»%f"
SPACESHIP_GIT_STATUS_DELETED="%F{yellow}✘%f"
SPACESHIP_GIT_STATUS_AHEAD="%F{yellow}⇡%f"
SPACESHIP_GIT_STATUS_BEHIND="%F{yellow}⇣%f"
SPACESHIP_GIT_STATUS_DIVERGED="%F{yellow}⇕%f"
SPACESHIP_GIT_STATUS_STASHED=""

# Disable global color
SPACESHIP_GIT_STATUS_COLOR=""

# Hide git status section when no changes
SPACESHIP_GIT_STATUS_SHOW=true
