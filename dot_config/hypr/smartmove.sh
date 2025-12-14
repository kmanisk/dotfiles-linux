
#!/bin/bash
# ~/.config/hypr/smartmove.sh
dir="$1"

# Count windows on the current workspace
win_count=$(hyprctl -j clients | jq length)

if [ "$win_count" -eq 2 ]; then
    # Hypothetical example: get split of first window
    split=$(hyprctl -j clients | jq -r '.[0].split')  # adjust field according to JSON output

    # If vertical split and moving up/down, switch to horizontal
    if [[ "$split" == "vertical" && ("$dir" == "u" || "$dir" == "d") ]]; then
        hyprctl dispatch togglesplit horizontal
        exit 0
    fi

    # If horizontal split and moving left/right, switch to vertical
    if [[ "$split" == "horizontal" && ("$dir" == "l" || "$dir" == "r") ]]; then
        hyprctl dispatch togglesplit vertical
        exit 0
    fi
fi

# fallback: just move the window normally
hyprctl dispatch movewindow "$dir"
