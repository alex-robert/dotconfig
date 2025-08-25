#!/bin/bash

# Script to convert an image to macOS .icns format
# Usage: ./make_icns.sh <input_image> [output_name]

set -e  # Exit on any error

usage_help() {
    echo "help: $0 <input_image> [output_name]"
    echo ""
    echo "Arguments:"
    echo "  input_image   Path to the input image file"
    echo "  output_name   Optional output name (without extension). Defaults to input filename."
    echo ""
    echo "Example:"
    echo "  $0 my_image.png"
    echo "  $0 /path/to/image.jpg custom_icon"
    exit 1
}

check_dependencies() {
    if ! command -v sips &> /dev/null; then
        echo "Error: sips command not found. This script requires macOS."
        exit 1
    fi
    
    if ! command -v iconutil &> /dev/null; then
        echo "Error: iconutil command not found. This script requires macOS."
        exit 1
    fi
}

cleanup() {
    if [ -d "$ICONSET_FOLDER" ]; then
        echo "Cleaning up temporary files..."
        rm -rf "$ICONSET_FOLDER"
    fi
}

trap cleanup EXIT

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    usage_help
fi

INPUT_IMAGE="$1"
OUTPUT_NAME="${2:-$(basename "${INPUT_IMAGE%.*}")}"

if [ ! -f "$INPUT_IMAGE" ]; then
    echo "Error: Input file '$INPUT_IMAGE' not found."
    exit 1
fi

check_dependencies

ICONSET_FOLDER="${OUTPUT_NAME}.iconset"

echo "==== Creating icons from '$INPUT_IMAGE'"
echo "Output will be: ${OUTPUT_NAME}.icns"

echo "==== Generating icon images..."

declare -a icon_specs=(
    "16 icon_16x16.png"
    "32 icon_16x16@2x.png"
    "32 icon_32x32.png"
    "64 icon_32x32@2x.png"
    "128 icon_128x128.png"
    "256 icon_128x128@2x.png"
    "256 icon_256x256.png"
    "512 icon_256x256@2x.png"
    "512 icon_512x512.png"
    "1024 icon_512x512@2x.png"
)

mkdir -p "$ICONSET_FOLDER"

for spec in "${icon_specs[@]}"; do
    read -r size filename <<< "$spec"
    echo "Creating ${filename} (${size}x${size})"
    
    if ! sips -s format png --resampleHeightWidth "$size" "$size" "$INPUT_IMAGE" --out "$ICONSET_FOLDER/$filename" &> /dev/null; then
        echo "Error: Failed to create $filename"
        exit 1
    fi
done

echo "==== Converting iconset to .icns format..."
if ! iconutil -c icns "$ICONSET_FOLDER" &> /dev/null; then
    echo "Error: Failed to convert iconset to icns"
    exit 1
fi

echo "✓ Successfully created ${OUTPUT_NAME}.icns"
echo "✓ Icon file ready at: $(pwd)/${OUTPUT_NAME}.icns"

# Cleanup will happen automatically via trap
