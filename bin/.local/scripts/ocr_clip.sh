#!/bin/bash

IMG="/tmp/ocr_screenshot.png"

maim -s "$IMG"
TEXT=$(tesseract "$IMG" stdout -l jpn)

echo "$TEXT" | xclip -selection clipboard

echo "$TEXT"

