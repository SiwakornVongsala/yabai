#!/usr/bin/env sh
set -eu

YABAI="$(command -v yabai)"
JQ="$(command -v jq)"

if [ -z "$YABAI" ] || [ -z "$JQ" ]; then
    echo "yabai and jq must be available in PATH" >&2
    exit 1
fi

focused_window_id="$("$YABAI" -m query --windows --window | "$JQ" -r '.id')"

largest_window_id="$(
    "$YABAI" -m query --windows --space |
        "$JQ" -r '
            map(select(
                ."is-floating" == false and
                ."is-minimized" == false and
                ."has-ax-reference" == true
            ))
            | sort_by(.frame.w * .frame.h)
            | last
            | .id // empty
        '
)"

if [ -z "$largest_window_id" ] || [ "$largest_window_id" = "$focused_window_id" ]; then
    exit 0
fi

"$YABAI" -m window --swap "$largest_window_id"
