#!/bin/bash

set -e

DOTFILES="$HOME/.dotfiles"

echo "Setting up dotfiles..."

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    read -p "Homebrew not found. Install it? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# Install Homebrew packages
read -p "Install Homebrew packages from Brewfile? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    brew bundle --file="$DOTFILES/Brewfile"
fi

# Symlink zsh config
echo "Setting up shell configuration..."
ln -sf "$DOTFILES/zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/hushlogin" "$HOME/.hushlogin"

# Git config
echo "Setting up Git..."
ln -sf "$DOTFILES/gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/gitignore_global" "$HOME/.gitignore_global"

# Ghostty config
echo "Setting up Ghostty..."
mkdir -p "$HOME/.config/ghostty"
ln -sf "$DOTFILES/ghostty/config" "$HOME/.config/ghostty/config"

# Zed settings
echo "Setting up Zed..."
mkdir -p "$HOME/.config/zed"
if [ -f "$HOME/.config/zed/settings.json" ] && [ ! -L "$HOME/.config/zed/settings.json" ]; then
    mv "$HOME/.config/zed/settings.json" "$HOME/.config/zed/settings.json.backup"
    echo "Backed up existing Zed settings"
fi
ln -sf "$DOTFILES/zed/settings.json" "$HOME/.config/zed/settings.json"

# Lazygit config
echo "Setting up Lazygit..."
mkdir -p "$HOME/Library/Application Support/lazygit"
if [ -f "$HOME/Library/Application Support/lazygit/config.yml" ] && [ ! -L "$HOME/Library/Application Support/lazygit/config.yml" ]; then
    mv "$HOME/Library/Application Support/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml.backup"
    echo "Backed up existing Lazygit config"
fi
ln -sf "$DOTFILES/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"

# Claude Code settings
CLAUDE_DIR="$HOME/.claude"
if [ -d "$CLAUDE_DIR" ]; then
    echo "Setting up Claude Code..."
    if [ -f "$CLAUDE_DIR/settings.json" ] && [ ! -L "$CLAUDE_DIR/settings.json" ]; then
        mv "$CLAUDE_DIR/settings.json" "$CLAUDE_DIR/settings.json.backup"
        echo "Backed up existing Claude settings"
    fi
    ln -sf "$DOTFILES/claude/settings.json" "$CLAUDE_DIR/settings.json"
fi

# macOS system preferences
read -p "Apply macOS system preferences? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    source "$DOTFILES/macos.sh"
fi

# Launch agent for sync check
read -p "Install sync checker launch agent? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Setting up sync checker..."
    chmod +x "$DOTFILES/scripts/sync-check.sh"
    mkdir -p "$HOME/Library/LaunchAgents"
    ln -sf "$DOTFILES/scripts/com.dotfiles.sync-check.plist" "$HOME/Library/LaunchAgents/"
    launchctl load "$HOME/Library/LaunchAgents/com.dotfiles.sync-check.plist" 2>/dev/null || true
fi

echo ""
echo "Setup complete!"
echo ""
echo "Manual steps:"
echo "  - Restart terminal to apply shell changes"
echo "  - Install nvm: curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash"
echo "  - Install bun: curl -fsSL https://bun.sh/install | bash"
