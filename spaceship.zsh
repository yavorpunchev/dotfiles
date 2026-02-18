SPACESHIP_PACKAGE_SHOW=false

# Keep async on (fast response)
SPACESHIP_PROMPT_ASYNC=true

# Reorder: put git at the end so async load doesn't shift other sections
SPACESHIP_PROMPT_ORDER=(
  dir
  node
  exec_time
  git
  line_sep
  char
)

# ----------------------------------------
# Git Status Colors
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

SPACESHIP_GIT_STATUS_SHOW=true
