# mac-window-manager

Personal `yabai` and `skhd` configuration for macOS.

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
~/.config/skhd/skhdrc   -> <repo>/skhd/skhdrc
```

## Shortcuts

```text
option + h/j/k/l          Focus a window
shift + option + h/j/k/l  Swap a window
option + r                Rotate layout
option + t                Toggle float
option + e                Balance layout
```
