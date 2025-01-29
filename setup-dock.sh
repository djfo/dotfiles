#!/bin/sh
if ! which -s dockutil; then
  echo "Utility »dockutil« not found."
  echo "Type »brew install dockutil« to install."
  exit 1
fi
dockutil --no-restart --remove all
dockutil --no-restart --add /System/Applications/Launchpad.app --after Finder
dockutil --no-restart --add /System/Applications/Mission\ Control.app --after Finder
dockutil --no-restart --add $HOME/Downloads --section others --display stack --view grid
dockutil --add /Applications --section others --after Downloads --view list --display folder
