#!/bin/bash
set -euo pipefail

# Only run in remote (cloud) sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install save-to-spotify CLI if not already present
if ! command -v save-to-spotify &>/dev/null; then
  echo "Installing save-to-spotify CLI..."
  curl -fsSL https://saveto.spotify.com/install.sh | bash
  echo "save-to-spotify installed successfully."
else
  echo "save-to-spotify already installed: $(save-to-spotify --version 2>/dev/null || true)"
fi
