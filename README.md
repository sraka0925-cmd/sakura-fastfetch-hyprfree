# HyprFree

**HyprFree** is a lightweight Hyprland utility that makes the focused window floating, then lets you move and resize it pixel by pixel. You are no longer limited by the tiling layout.

It does not replace Hyprland or create its own window manager—it uses Hyprland's official `hyprctl` interface.

## Features

- automatically make the focused window floating,
- move a window in any direction,
- increase or decrease its width and height,
- set an exact position and exact size,
- return a window to the tiling layout.

## Requirements

- a running Hyprland session,
- `hyprctl`,
- `jq` (to check the focused window state),
- Bash.

On Arch Linux:

```bash
sudo pacman -S jq
```

## Installation

```bash
git clone https://github.com/sraka0925-cmd/sakura-fastfetch-hyprfree.git
cd hyprfree
bash install.sh
```

The installer copies the utility to `~/.local/bin/hyprfree` and a sample configuration to `~/.config/hyprfree/config` (without overwriting an existing configuration).

Then add this to `~/.config/hypr/hyprland.conf`:

```conf
source = ~/.config/hyprfree/hyprland.conf
```

Reload the configuration (`hyprctl reload`) or restart Hyprland.

## Keybindings

The default modifier is `SUPER + ALT`.

| Shortcut | Action |
| --- | --- |
| `H/J/K/L` | move left/down/up/right |
| Arrow keys | move the window |
| `A/D` | decrease/increase width |
| `W/S` | increase/decrease height |
| `F` | toggle floating mode |
| `R` | return to the tiling layout |

Moving or resizing automatically enables floating mode for the focused window.

## Terminal usage

```bash
# move the focused window 40 px to the right
hyprfree move 40 0

# change the size by 120 px in width and -60 px in height
hyprfree resize 120 -60

# exact X=100, Y=80 position in workspace coordinates
hyprfree place 100 80

# exact 1000×700 px size
hyprfree size 1000 700

# restore tiling
hyprfree tile
```

Values passed to `move` and `resize` are relative. `place` and `size` use exact values.

## Configuration

Edytuj `~/.config/hyprfree/config`:

```bash
MOVE_STEP=40
RESIZE_STEP=80
MIN_WIDTH=160
MIN_HEIGHT=120
```

Changing `MOVE_STEP` and `RESIZE_STEP` affects keybindings; terminal resize commands remain exact.

## `ff` — animated sakura for Fastfetch

The installer also adds the `ff` command. It shows a short animation of a sakura tree with falling petals and Fastfetch information without the standard Arch logo.

```bash
ff
```

The configuration is located at `~/.config/fastfetch/ff-sakura.jsonc`. It deliberately excludes the `localip`, `publicip`, `wifi`, `dns`, and `netio` modules, so `ff` does not display your IP address or network data. To make the animation longer or shorter:

```bash
FF_FRAME_COUNT=18 ff
```

## Important limitation

Hyprland may still enforce a minimum size declared by an application. HyprFree removes **tiling-layout** limits, but it does not bypass compositor security rules or restrictions imposed by an application itself.

## License

MIT — see [LICENSE](LICENSE).
##Yeah anyways thx if you stopped by
