#!/bin/bash

# Check if dotfiles are in sync with remote
cd ~/.dotfiles

if [ -n "$(git status --porcelain)" ]; then
    osascript -e 'display notification "Uncommitted changes in dotfiles" with title "Dotfiles"'
fi

git fetch origin main --quiet
LOCAL=$(git rev-parse HEAD)
REMOTE=$(git rev-parse origin/main)

if [ "$LOCAL" != "$REMOTE" ]; then
    osascript -e 'display notification "Dotfiles out of sync with remote" with title "Dotfiles"'
fi
