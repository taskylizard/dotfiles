#!/bin/bash

set -e

for file in "$HOME"/.dotmodules/install/*.sh; do
	# shellcheck disable=1090
	source "$file"
done
