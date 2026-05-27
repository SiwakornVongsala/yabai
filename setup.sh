#!/usr/bin/env sh
set -eu

REPO_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" && pwd)"

mkdir -p "$HOME/.config/yabai" "$HOME/.config/skhd"

ln -sfn "$REPO_DIR/yabai/yabairc" "$HOME/.config/yabai/yabairc"
ln -sfn "$REPO_DIR/skhd/skhdrc" "$HOME/.config/skhd/skhdrc"
chmod +x "$REPO_DIR/yabai/yabairc"

printf 'Linked yabai and skhd configs from %s\n' "$REPO_DIR"
printf 'Run: yabai --restart-service; skhd --restart-service\n'
