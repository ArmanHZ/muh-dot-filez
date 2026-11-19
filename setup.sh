#!/usr/bin/env bash
#
# Install or update this repository's config files in $HOME.
# Usage: ./setup.sh [--dry-run]

set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

dry_run=0
case "${1-}" in
    -n | --dry-run) dry_run=1 ;;
    -h | --help)
        printf 'Usage: %s [--dry-run]\n' "${0##*/}"
        exit 0
        ;;
    "") ;;
    *)
        printf 'Unknown argument: %s\n' "$1" >&2
        exit 2
        ;;
esac

# Print the command, and run it unless --dry-run was given.
run() {
    printf '  %s\n' "$*"
    if ((dry_run == 0)); then
        "$@"
    fi
}

# Copy the contents of src into dst. Keep modes and timestamps.
# Files that exist only in dst stay in place (for example nvim's lazy-lock.json).
copy_tree() {
    local src=$1 dst=$2
    run mkdir -p "$dst"
    run cp -a "$src/." "$dst/"
}

printf 'Installing dotfiles from %s\n' "$repo_dir"

printf 'zshrc -> %s\n' "$HOME/.zshrc"
run cp -a "$repo_dir/zshrc" "$HOME/.zshrc"

printf 'nvim/ -> %s\n' "$HOME/.config/nvim"
copy_tree "$repo_dir/nvim" "$HOME/.config/nvim"

printf 'Scripts/ -> %s\n' "$HOME/.config/Scripts"
copy_tree "$repo_dir/Scripts" "$HOME/.config/Scripts"

printf 'Done.\n'
