#!/usr/bin/env sh
set -eu

YABAI="$(command -v yabai)"
JQ="$(command -v jq)"

if [ -z "$YABAI" ] || [ -z "$JQ" ]; then
    echo "yabai and jq must be available in PATH" >&2
    exit 1
fi

"$YABAI" -m space --layout float

# Make floating windows large while retaining a visible margin for dragging.
"$YABAI" -m query --windows --space |
    "$JQ" -r '.[] | select(."can-resize" and ."has-ax-reference" and (."is-minimized" | not)) | .id' |
    while IFS= read -r window_id; do
        "$YABAI" -m window "$window_id" --grid 40:40:1:1:38:38
    done
