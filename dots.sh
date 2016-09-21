#!/usr/bin/env bash

# Created by Sebastián Landínez, based on https://github.com/gato-omega/my-dots
set -eu   # Make that the errors in every script stop the execution of the general script.

# Put some defaults related to the environment
# sh scripts/defaults.sh
# First of all, install brew and some other required installers
sh scripts/binaries.sh
# I think the first should be install ZSH and the plugin managers, in this case, we'll use
# zPlug, can be found in: https://github.com/zplug/zplug
sh scripts/install_zsh.sh
# Add the ssh-key to the system
sh scripts/ssh_add.sh
# Install some apps through Brew. This includes chrome, skype, atom, etc.
sh scripts/apps.sh
# Do some configurations for security checks
# sh scripts/security.sh
# Setting the Ruby environment
zsh scripts/rbenv.sh
read -p "Most of the scripts run require a restart of the system. Do you wish to restart now? [y/n] " confirmation
case $confirmation in
  [Yy]* )
    sudo shutdown -r now
    ;;
  [Nn]* )
    echo "Remember to restart your PC!."
    ;;
esac
