#!/usr/bin/env sh
set -eu

YABAI="$(command -v yabai)"
JQ="$(command -v jq)"

if [ -z "$YABAI" ] || [ -z "$JQ" ]; then
    echo "yabai and jq must be available in PATH" >&2
    exit 1
fi

"$YABAI" -m space --layout float

# Left 80% of the screen; the remaining 20% is left free to place a mobile
# emulator manually.
"$YABAI" -m query --windows --space |
    "$JQ" -r '.[] | select(."can-resize" and ."has-ax-reference" and (."is-minimized" | not)) | .id' |
    while IFS= read -r window_id; do
        "$YABAI" -m window "$window_id" --grid 1:5:0:0:4:1
    done
