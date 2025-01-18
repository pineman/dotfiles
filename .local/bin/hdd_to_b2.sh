#!/usr/bin/env bash
set -euxo pipefail
b2 sync --delete --replaceNewer /run/media/pineman/Backup/pineman-Archive b2://pineman-Archive/
b2 sync --delete --replaceNewer /run/media/pineman/Backup/pineman-Documents b2://pineman-Documents/
