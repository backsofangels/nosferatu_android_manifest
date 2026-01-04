#!/bin/bash

# =================================================================
# Nosferatu OS - Environment Setup Script
# Target: AOSP 7.1.2 (Nougat)
# =================================================================

# Exit immediately if a command exits with a non-zero status
set -e

# Configuration - Replace with your actual GitHub username
GITHUB_USER="backsofangels"
MANIFEST_URL="https://github.com/${GITHUB_USER}/android_manifest.git"
MANIFEST_BRANCH="main"

echo "=================================================="
echo "   Nosferatu OS: Initializing Workspace"
echo "=================================================="

# 1. Check if 'repo' tool is installed
if ! command -v repo &> /dev/null; then
    echo "Error: 'repo' tool is not installed."
    echo "Please install it using: sudo apt update && sudo apt install repo"
    exit 1
fi

# 2. Initialize the repository
# We point to your custom manifest which links AOSP and Nosferatu trees
echo "[*] Initializing manifest from: ${MANIFEST_URL}"
repo init -u "$MANIFEST_URL" -b "$MANIFEST_BRANCH"

# 3. Synchronize the source code
# -c: Current branch only (saves bandwidth and disk space)
# -j$(nproc): Use all available CPU cores for faster download
# --force-sync: Overwrite local changes if necessary to match the manifest
# --no-clone-bundle: Disables git bundle for faster initialization
echo "[*] Starting synchronization. This may take a while depending on your connection..."
repo sync -c -j$(nproc) --force-sync --no-clone-bundle --no-tags

echo "=================================================="
echo "   Synchronization successful!"
echo "=================================================="
echo "   To start the build process, run:"
echo ""
echo "   source build/envsetup.sh"
echo "   lunch nos_emu_x86-eng"
echo "   make -j$(nproc)"
echo "=================================================="