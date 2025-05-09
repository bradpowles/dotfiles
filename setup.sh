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

echo "$SCRIPT_DIR" > "$HOME"/.dotfiles && echo "Successfully set $HOME/.dotfiles to $SCRIPT_DIR"


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

cp "$SSH_CONFIG_FILE" "$SSH_CONFIG_FILE.bak" 2>/dev/null && echo "Backing up $SSH_CONFIG_FILE."
touch "$SSH_CONFIG_FILE"
grep -q "^Host \*" "$SSH_CONFIG_FILE" || echo "\n\nHost *\n" >> "$SSH_CONFIG_FILE"
for flag in "${ssh_flags[@]}"; do
    search_flag=$(echo "$flag" | awk '{print $1}') 
    grep -q "$search_flag" "$SSH_CONFIG_FILE" || sed -i "/^Host \*/a\\    $flag" "$SSH_CONFIG_FILE"
done

echo "SSH config file complete."


# Add default SSH key fingerprints

SSH_KNOWN_HOSTS_FILE="$HOME/.ssh/known_hosts"
ssh_key_fingerprints=(
    "github.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOMqqnkVzrm0SdG6UOoqKLsabgH5C9okWi0dh2l9GKJl"
    "github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg="
    "github.com ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCj7ndNxQowgcQnjshcLrqPEiiphnt+VTTvDP6mHBL9j1aNUkY4Ue1gvwnGLVlOhGeYrnZaMgRK6+PKCUXaDbC7qtbW8gIkhL7aGCsOr/C56SJMy/BCZfxd1nWzAOxSDPgVsmerOBYfNqltV9/hWCqBywINIR+5dIg6JTJ72pcEpEjcYgXkE2YEFXV1JHnsKgbLWNlhScqb2UmyRkQyytRLtL+38TGxkxCflmO+5Z8CSSNY7GidjMIZ7Q4zMjA2n1nGrlTDkzwDCsw+wqFPGQA179cnfGWOWRVruj16z6XyvxvjJwbz0wQZ75XK5tKSb7FNyeIEs4TT4jk+S4dhPeAUC5y+bDYirYgM4GC7uEnztnZyaVWQ7B381AK4Qdrwt51ZqExKbQpTUNn+EjqoTwvqNj4kqx5QUCI0ThS/YkOxJCXmPUWZbhjpCg56i+2aB6CmK2JGhn57K5mj0MNdBXA4/WnwH6XoPWJzK5Nyu2zB3nAZp+S5hpQs+p1vN1/wsjk="
)
cp "$SSH_KNOWN_HOSTS_FILE" "$SSH_KNOWN_HOSTS_FILE.bak" 2>/dev/null && echo "Backing up $SSH_KNOWN_HOSTS_FILE."
touch "$SSH_KNOWN_HOSTS_FILE"
for fingerprint in "${ssh_key_fingerprints[@]}"; do
    grep -q "$fingerprint" "$SSH_KNOWN_HOSTS_FILE" || echo "$fingerprint" >> "$SSH_KNOWN_HOSTS_FILE"
done

echo "SSH known host keys complete."

