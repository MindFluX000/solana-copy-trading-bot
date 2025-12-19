#!/bin/bash

# Shell script for cross-compiling Rust projects for Windows from Ubuntu/Linux

set -e

# Constants
TARGET_X86_64="x86_64-pc-windows-gnu"
TARGET_I686="i686-pc-windows-gnu"

# Function to print messages
function echo_info() {
    echo "[INFO] $1"
}

function echo_error() {
    echo "[ERROR] $1" >&2
}

function echo_success() {
    echo "[SUCCESS] $1"
}

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo_error "This script is designed for Linux systems only."
    echo_info "For other platforms, use: cargo build --release"
    exit 1
fi

# Update and install required packages
echo_info "Updating package list..."
sudo apt update

echo_info "Installing mingw-w64 for cross-compilation..."
sudo apt install -y mingw-w64

echo_info "Adding Rust targets for Windows..."
rustup target add $TARGET_X86_64
rustup target add $TARGET_I686

# Build the project for x86_64 Windows
echo_info "Building for 64-bit Windows..."
if cargo build --target=$TARGET_X86_64 --release; then
    echo_success "64-bit Windows build completed!"
else
    echo_error "Failed to build for 64-bit Windows"
    exit 1
fi

# Build the project for i686 Windows
echo_info "Building for 32-bit Windows..."
if cargo build --target=$TARGET_I686 --release; then
    echo_success "32-bit Windows build completed!"
else
    echo_error "Failed to build for 32-bit Windows"
    exit 1
fi

echo_success "All builds completed successfully!"
echo_info "Binaries location:"
echo_info "  64-bit: target/$TARGET_X86_64/release/solana-vntr-sniper.exe"
echo_info "  32-bit: target/$TARGET_I686/release/solana-vntr-sniper.exe"