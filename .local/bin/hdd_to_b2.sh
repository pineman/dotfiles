#!/bin/bash
set -euxo pipefail
b2 sync --delete --replaceNewer /run/media/pineman/Backup/b2-arch b2://pineman-Archive/
b2 sync --delete --replaceNewer /run/media/pineman/Backup/b2 b2://pineman-Documents/
