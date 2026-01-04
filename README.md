# Nosferatu OS - Manifest Repository

This repository contains the official Android manifest for **Nosferatu OS**, based on AOSP 7.1.2 (Nougat). It serves as the entry point for synchronizing all the required source code, including custom device trees, vendor configurations, and the core Android Open Source Project.

## Prerequisites

Before you begin, ensure your build environment is ready. You will need:

- A Linux environment (WSL2 with Ubuntu 20.04+ was used in development).
- At least 100GB of free disk space.
- The `repo` tool installed and configured in your path.

```bash
# To install 'repo' on Ubuntu/WSL:
sudo apt update && sudo apt install repo
```

## Getting Started

To initialize your local workspace and start downloading the source code, you can use the provided setup script or follow the manual steps.

### Option 1: Using the Setup Script (Recommended)

We provide a convenient script to handle initialization and synchronization automatically.

```bash
mkdir nosferatu && cd nosferatu
curl -s https://raw.githubusercontent.com/backsofangels/nosferatu_android_manifest/main/nos-init.sh
```

### Option 2: Manual Initialization

If you prefer to run the commands manually:

```bash
# Initialize the repository
repo init -u https://github.com/backsofangels/nosferatu_android_manifest.git -b main

# Sync the source code
repo sync -c -j$(nproc) --force-sync --no-clone-bundle --no-tags
```

## Project Structure

Once the synchronization is complete, the workspace will be organized as follows:

- build/, frameworks/, system/, etc.: Standard AOSP 7.1.2 core components.
- device/nosferatu/: Custom device tree for the Nosferatu Emulator (x86).
- vendor/nosferatu/: Custom vendor tree containing prebuilt APKs (Launcher) and branding.

## Building the OS

After a successful sync, follow these commands to build the image:

```bash
# Set up the environment
source build/envsetup.sh

# Select the target
lunch nos_emu_x86-eng

# Start the build
make -j$(nproc)
```

## License

The manifest and scripts in this repository are licensed under the Apache License 2.0.
