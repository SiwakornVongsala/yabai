# mac-window-manager

Personal `yabai` and `skhd` configuration for macOS.

Spaces start with zero outer padding and a 4px window gap. Applications open
on the currently active Space unless macOS or a local yabai rule moves them.

## Setup

Install `yabai` and `skhd`, grant both programs Accessibility access, then
link these configuration files into their default locations:

```sh
./setup.sh
yabai --restart-service
skhd --restart-service
```

The setup script creates:

```text
~/.config/yabai/yabairc -> <repo>/yabai/yabairc
~/.config/yabai/float-large-space.sh -> <repo>/yabai/float-large-space.sh
~/.config/yabai/swap-largest-window.sh -> <repo>/yabai/swap-largest-window.sh
~/.config/skhd/skhdrc   -> <repo>/skhd/skhdrc
```

## Shortcuts

```text
option + h/j/k/l          Focus a window
shift + option + h/j/k/l  Swap a window
control + option + return Swap the focused window with the largest tiled window
option + n/p/b            Focus next / previous / recent window
option + f                Focus Space 4
option + z                Toggle zoom parent
control + option + s      Toggle split direction
option + r                Rotate layout
option + t                Toggle float
option + e                Balance layout
shift + option + t        Float and enlarge all windows in the current Space
shift + control + option + t Float and enlarge all windows almost full-screen
shift + option + 0        Float and enlarge all windows full-screen
shift + option + b        Return the current Space to tiled BSP layout
shift + option + x/y      Mirror layout horizontally / vertically
option + g                Toggle window gap
shift + option + g        Toggle padding
shift + option + left/right Move window to adjacent Space and follow it
option + 1..9             Focus a numbered Space
shift + option + 1..9     Move window to a numbered Space and follow it
option + a/s/d/f          Focus Spaces 1 / 2 / 3 / 4
shift + option + a/s/d/f  Move window to Spaces 1 / 2 / 3 / 4 and follow it
control + option + h/l    Focus display to the west / east
shift + control + option + h/l Move window to display west / east and follow it
control + option + left/right Adjust focused tile split ratio
```

Hold `option` and drag with the primary mouse button to move a window, or drag
with the secondary mouse button to resize it.
