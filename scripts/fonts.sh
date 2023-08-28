#!/bin/bash

git clone https://github.com/google/fonts.git /tmp/google-fonts

cd /tmp/google-fonts

sudo find . -name "*.ttf" -exec cp '{}' /usr/local/share/fonts \;
sudo fc-cache -fv
rm -rf /tmp/google-fonts

echo "Fonts installed and cache updated."
