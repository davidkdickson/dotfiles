#!/bin/bash
# Codex passes a notification JSON payload as an argument; afplay needs only the sound.
set -eu
script_dir=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
exec /usr/bin/afplay "$script_dir/../claude/sounds/R2D2.aiff"
