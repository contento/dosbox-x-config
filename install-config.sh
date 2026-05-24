#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_file="$script_dir/DOSBox-X.Preferences"

if [[ ! -f "$source_file" ]]; then
  echo "Missing source file: $source_file"
  exit 1
fi

platform="$(uname -s)"
case "$platform" in
  Darwin)
    dest_dir="$HOME/Library/Preferences"
    dest_file="DOSBox-X 2026.05.02 Preferences"
    ;;
  Linux)
    dest_dir="$HOME/.config/dosbox-x"
    dest_file="dosbox-x.conf"
    ;;
  *)
    echo "Unsupported platform: $platform"
    echo "Use install-config.ps1 on Windows or copy the file manually."
    exit 1
    ;;
 esac

mkdir -p "$dest_dir"
cp -f "$source_file" "$dest_dir/$dest_file"
echo "Installed $source_file -> $dest_dir/$dest_file"
