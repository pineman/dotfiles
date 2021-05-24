#!/bin/bash
set -euxo pipefail

backblaze-b2 sync --noProgress --keepDays 30 --threads 8 /home/pineman/Documents b2://pineman-Documents
