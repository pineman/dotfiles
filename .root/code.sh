#!/bin/bash
set -euxo pipefail
code --install-extension marcoms.oceanic-plus
code --install-extension vscodevim.vim
code --install-extension golang.Go
kubectl krew install exec-as
