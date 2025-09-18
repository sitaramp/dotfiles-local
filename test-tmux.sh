#!/bin/bash
# Test OSC 52 clipboard support
echo -e "\033]52;c;$(echo "test clipboard" | base64)\a"

# For hyperlink support
echo -e "\e]8;;https://tmux.github.io\e\\This is a hyperlink\e]8;;\e\\"
