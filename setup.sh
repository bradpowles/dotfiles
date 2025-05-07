#!/usr/bin/env bash


SCRIPT_DIR="$(dirname "$(realpath "$0")")"


# Link in .bashrc file

DOTFILES_BASHRC="$SCRIPT_DIR/bashrc"
USER_BASHRC="$HOME/.bashrc"

if [ -f "$USER_BASHRC" ]; then
    echo "Warning: $USER_BASHRC already exists. Please delete this."
fi

ln -s "$DOTFILES_BASHRC" "$USER_BASHRC" && echo "Successfully linked $USER_BASHRC to $DOTFILES_BASHRC"


# Link in .vimrc file

DOTFILES_VIMRC="$SCRIPT_DIR/vimrc"
USER_VIMRC="$HOME/.vimrc"

if [ -f "$USER_VIMRC" ]; then
    echo "Warning: $USER_VIMRC already exists. Please delete this."
fi

ln -s "$DOTFILES_VIMRC" "$USER_VIMRC" && echo "Successfully linked $USER_VIMRC to $DOTFILES_VIMRC"


# Store Dotfiles location.

echo $SCRIPT_DIR > $HOME/.dotfiles && echo "Successfully set $HOME/.dotfiles to $SCRIPT_DIR"


# Setup .bash_extras for local settings

touch ~/.bash_extras


# Setup default SSH config

SSH_CONFIG_FILE="$HOME/.ssh/config"
ssh_flags=(
    "ForwardAgent no"
    "StrictHostKeyChecking yes"
    "ServerAliveInterval 60"
    "ServerAliveCountMax 3"
)

cp "$SSH_CONFIG_FILE" "$SSH_CONFIG_FILE.bak" 2>/dev/null && echo "Backing up $SSH_CONFIG_FILE." || touch $SSH_CONFIG_FILE
grep -q "^Host \*" "$SSH_CONFIG_FILE" || sed -i "1s/^/Host \*\n\n/" "$SSH_CONFIG_FILE"
for flag in "${ssh_flags[@]}"; do
    grep -q "$flag" "$SSH_CONFIG_FILE" || sed -i "/^Host \*/a\\    $flag" "$SSH_CONFIG_FILE"
done

echo "SSH config file complete."


