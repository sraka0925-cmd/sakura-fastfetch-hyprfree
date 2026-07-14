#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="${HOME}/.local/bin"
CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/hyprfree"
FASTFETCH_CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/fastfetch"

mkdir -p "$BIN_DIR" "$CONFIG_DIR" "$FASTFETCH_CONFIG_DIR"
install -m 755 "$ROOT_DIR/bin/hyprfree" "$BIN_DIR/hyprfree"
install -m 755 "$ROOT_DIR/bin/ff" "$BIN_DIR/ff"

if [[ ! -f "$CONFIG_DIR/config" ]]; then
  install -m 644 "$ROOT_DIR/config/config" "$CONFIG_DIR/config"
  echo "Created configuration: $CONFIG_DIR/config"
else
  echo "Kept existing configuration: $CONFIG_DIR/config"
fi

if [[ ! -f "$FASTFETCH_CONFIG_DIR/ff-sakura.jsonc" ]]; then
  install -m 644 "$ROOT_DIR/config/ff-sakura.jsonc" "$FASTFETCH_CONFIG_DIR/ff-sakura.jsonc"
  echo "Created Fastfetch configuration: $FASTFETCH_CONFIG_DIR/ff-sakura.jsonc"
else
  echo "Kept existing Fastfetch configuration: $FASTFETCH_CONFIG_DIR/ff-sakura.jsonc"
fi

echo "Installed: $BIN_DIR/hyprfree"
echo "Installed: $BIN_DIR/ff (animated sakura for Fastfetch)"
echo "Add to hyprland.conf: source = ~/.config/hyprfree/hyprland.conf"
