#!/usr/bin/env sh
set -eu

YABAI="$(command -v yabai)"
JQ="$(command -v jq)"
MODE="${1:-large}"

if [ -z "$YABAI" ] || [ -z "$JQ" ]; then
    echo "yabai and jq must be available in PATH" >&2
    exit 1
fi

"$YABAI" -m space --layout float

case "$MODE" in
    large)
        GRID="40:40:1:1:38:38"
        ;;
    xlarge)
        GRID="80:80:1:1:78:78"
        ;;
    full)
        GRID="1:1:0:0:1:1"
        ;;
    *)
        echo "Usage: $0 [large|xlarge|full]" >&2
        exit 1
        ;;
esac

# Resize floating windows in the current Space according to the selected mode.
"$YABAI" -m query --windows --space |
    "$JQ" -r '.[] | select(."can-resize" and ."has-ax-reference" and (."is-minimized" | not)) | .id' |
    while IFS= read -r window_id; do
        "$YABAI" -m window "$window_id" --grid "$GRID"
    done
