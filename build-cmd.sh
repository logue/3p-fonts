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

# Copy Cascadia Code
cp -r "$FONTS_SOURCE_DIR/cascadia/Cascadia-License.txt" "fonts/"
cp -r $FONTS_SOURCE_DIR/cascadia/*.ttf "fonts/"

# Copy DejaVu
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVu-License.txt" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSans.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSans-Bold.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSans-BoldOblique.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSans-Oblique.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSansMono.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSansMono-Bold.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSansMono-BoldOblique.ttf" "fonts/"
cp -r "$FONTS_SOURCE_DIR/dejavu/DejaVuSansMono-Oblique.ttf" "fonts/"

# Copy Fira Sans/Code
cp -r "$FONTS_SOURCE_DIR/fira/Fira-License.txt" "fonts/"
cp -r $FONTS_SOURCE_DIR/fira/*.ttf "fonts/"

# Copy IBMPlex
cp -r "$FONTS_SOURCE_DIR/ibmplex/IBMPlex-License.txt" "fonts/"
cp -r $FONTS_SOURCE_DIR/ibmplex/*.otf "fonts/"

# Copy Jetbrains Mono
cp -r "$FONTS_SOURCE_DIR/jetbrains/JetbrainsMono-License.txt" "fonts/"
cp -r $FONTS_SOURCE_DIR/jetbrains/*.ttf "fonts/"

# Copy Monospace
cp -r "$FONTS_SOURCE_DIR/monaspace/Monaspace-License.txt" "fonts/"
cp -r $FONTS_SOURCE_DIR/monaspace/*.otf "fonts/"

# Copy Noto-CJK
cp -r "$FONTS_SOURCE_DIR/noto/NotoSans-License.txt" "fonts/"
cp -r $FONTS_SOURCE_DIR/noto/*.ttf "fonts/"

# Copy Noto-CJK
cp -r "$FONTS_SOURCE_DIR/noto-cjk/NotoCJK-License.txt" "fonts/"
cp -r "$FONTS_SOURCE_DIR/noto-cjk/NotoSansCJK-Bold.ttc" "fonts/"
cp -r "$FONTS_SOURCE_DIR/noto-cjk/NotoSansCJK-Regular.ttc" "fonts/"

# Copy OpenDyslexic
cp -r "$FONTS_SOURCE_DIR/opendyslexic/OpenDyslexic-License.txt" "fonts/"
cp -r $FONTS_SOURCE_DIR/opendyslexic/*.otf "fonts/"

# Copy Source Sans
cp -r "$FONTS_SOURCE_DIR/source/SourceSans-License.txt" "fonts/"
cp -r $FONTS_SOURCE_DIR/source/*.otf "fonts/"

# Copy Ubuntu
cp -r "$FONTS_SOURCE_DIR/ubuntu/Ubuntu-License.txt" "fonts/"
cp -r $FONTS_SOURCE_DIR/ubuntu/*.ttf "fonts/"

# Copy Twemoji
cp -r $FONTS_SOURCE_DIR/twemoji/*.txt "fonts/"
cp -r $FONTS_SOURCE_DIR/twemoji/*.ttf "fonts/"

mkdir -p LICENSES
cp "../LICENSE.md" LICENSES/fonts.txt
