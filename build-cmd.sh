#!/usr/bin/env bash

# turn on verbose debugging output for logs.
exec 4>&1; export BASH_XTRACEFD=4; set -x
# make errors fatal
set -e
# bleat on references to undefined shell variables
set -u

# The tut package itself doesn't seem to have a version number anywhere other than 
# the original source directory name, which conflicts with our vendor branching convention; 
# So.. the original version has been preserved here and will be used to construct
# the version file for autobuild to read.
FONTS_VERSION=$(git rev-parse --short HEAD)
echo "$FONTS_VERSION" | sed 's/-/./g' > VERSION.txt

# this script should be executed from the build output directory (stage)
FONTS_SOURCE_DIR="../fonts"

mkdir -p fonts

# Copy DejaVu
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVu-License.txt" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSans.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSans-Bold.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSans-BoldOblique.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSans-Oblique.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSansMono.ttf" "fonts/"

# Copy Noto-CJK
cp -r "$FONTS_SOURCE_DIR/noto-cjk/NotoCJK-License.txt" "fonts/"
cp -r "$FONTS_SOURCE_DIR/noto-cjk/NotoSansCJK-Bold.ttc" "fonts/"
cp -r "$FONTS_SOURCE_DIR/noto-cjk/NotoSansCJK-Regular.ttc" "fonts/"

mkdir -p LICENSES
cp "../LICENSE.md" LICENSES/fonts.txt
