#!/bin/sh

source $(brew --prefix)/share/antigen/antigen.zsh

bundles=(
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-completions
)

for bundle in $bundles; do
    if ! antigen list | grep -q $bundle; then
        antigen bundle $bundle
    fi
done

antigen apply