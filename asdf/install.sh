#!/bin/sh

versions=(
    1.25.16
    1.28.12
    1.29.7
)

asdf plugin add kubectl
# install latest version
asdf install kubectl $(curl -L -s https://dl.k8s.io/release/stable.txt)

# install other versions
for version in ${versions[@]}; do
    asdf install kubectl $version
done
