# dotfiles

Sensible dotfiles for my Macs.

## Assumptions

  1. Dotfiles are stored in iCloud Drive
  1. Run a script to symlink dotfiles from iCloud Drive to homedir and install/update things.
  1. Be idempotent. 

## Setup

  1. Clone repo

  `git clone --recursive https://github.com/fidel/dotfiles.git "~/Library/Mobile Documents/com~apple~CloudDocs/dotfiles"`

  2. Run the setup script

  `$ ~/Library/Mobile Documents/com~apple~CloudDocs/dotfiles/bin/setup-new-mac`

## Kudos

Inspired by [searls/icloud-dotfiles](https://github.com/searls/icloud-dotfiles).
