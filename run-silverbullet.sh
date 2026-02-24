#!/usr/bin/env bash
# Download SilverBullet binary and run it with SHREYA-LEARNING-DAY as the space on port 3030.
# Usage: ./run-silverbullet.sh
# Requires: curl, unzip. On Ubuntu: sudo apt install curl unzip

set -e
REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
SPACE_DIR="${REPO_ROOT}/SHREYA-LEARNING-DAY"
PORT=3030
INSTALL_DIR="${REPO_ROOT}/.silverbullet-bin"
BINARY_NAME="silverbullet"

if [[ ! -d "$SPACE_DIR" ]]; then
  echo "Error: Space directory not found: $SPACE_DIR"
  exit 1
fi

# Resolve architecture for Linux
ARCH="$(uname -m)"
case "$ARCH" in
  x86_64|amd64)   ASSET="silverbullet-server-linux-x86_64.zip" ;;
  aarch64|arm64)  ASSET="silverbullet-server-linux-aarch64.zip" ;;
  *)
    echo "Error: Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

# Fetch latest release tag from GitHub
LATEST_TAG="${SILVERBULLET_VERSION:-$(curl -sSf 'https://api.github.com/repos/silverbulletmd/silverbullet/releases/latest' | sed -n 's/.*"tag_name": *"\([^"]*\)".*/\1/p')}"
if [[ -z "$LATEST_TAG" ]]; then
  echo "Error: Could not determine latest SilverBullet version."
  exit 1
fi

DOWNLOAD_URL="https://github.com/silverbulletmd/silverbullet/releases/download/${LATEST_TAG}/${ASSET}"
ZIP_PATH="${INSTALL_DIR}/${ASSET}"

mkdir -p "$INSTALL_DIR"
if [[ ! -x "${INSTALL_DIR}/${BINARY_NAME}" ]]; then
  echo "Downloading SilverBullet ${LATEST_TAG} (${ASSET})..."
  curl -sSLf -o "$ZIP_PATH" "$DOWNLOAD_URL"
  echo "Extracting..."
  unzip -o -q "$ZIP_PATH" -d "$INSTALL_DIR"
  rm -f "$ZIP_PATH"
  chmod +x "${INSTALL_DIR}/${BINARY_NAME}"
fi

echo "Starting SilverBullet on http://localhost:${PORT} with space: $SPACE_DIR"
exec "${INSTALL_DIR}/${BINARY_NAME}" -p"${PORT}" "$SPACE_DIR"
