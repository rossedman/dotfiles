#!/bin/sh

plugins=(
    oidc-login
)

for plugin in $plugins; do
    if ! kubectl krew list | grep -q $plugin; then
        kubectl krew install $plugin
    fi
done