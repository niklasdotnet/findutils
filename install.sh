#!/usr/bin/env bash

set -euo pipefail

REPO="niklasdotnet/findutils"
BINARY_NAME="find"
INSTALL_DIR="/usr/local/bin"
INSTALL_PATH="${INSTALL_DIR}/${BINARY_NAME}"
DOWNLOAD_URL="https://raw.githubusercontent.com/${REPO}/main/bin/${BINARY_NAME}"

require_cmd() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Error: '$1' is required but not installed." >&2
    exit 1
  fi
}

confirm_install() {
  # In curl-pipe mode there is usually no TTY; skip the prompt.
  if [[ ! -t 0 ]]; then
    return
  fi

  read -r -p "Install ${BINARY_NAME} to ${INSTALL_PATH}? [y/N] " answer
  case "$answer" in
    y|Y|yes|YES) ;;
    *)
      echo "Aborting."
      exit 1
      ;;
  esac
}

install_binary() {
  local tmp_file
  tmp_file="$(mktemp)"
  trap 'rm -f "${tmp_file:-}"' EXIT

  echo "Downloading ${BINARY_NAME}..."
  curl -fsSL "$DOWNLOAD_URL" -o "$tmp_file"
  chmod +x "$tmp_file"

  if [[ -w "$INSTALL_DIR" ]]; then
    mv "$tmp_file" "$INSTALL_PATH"
  else
    require_cmd sudo
    sudo mv "$tmp_file" "$INSTALL_PATH"
  fi
}

main() {
  require_cmd curl
  confirm_install
  install_binary
  echo "Installed to ${INSTALL_PATH}"
  echo "Run '${BINARY_NAME} --help' to verify."
}

main "$@"