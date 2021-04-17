#!/bin/bash
#set -euxo pipefail
set -x

# source ~/Documents/Secrets/duplicacy_env
# duplicacy init -e -storage-name local documents /backup/documents-duplicacy
# duplicacy add -e -copy local backblaze documents 'b2://pineman-Documents'

cd /home/pineman/Documents
source Secrets/duplicacy_env
duplicacy prune -keep 3:30
duplicacy prune -keep 7:360
duplicacy prune -exhaustive
duplicacy -s CHUNK_CACHE -s PACK_END backup -hash
duplicacy -s SNAPSHOT_COPY copy -to backblaze -threads 4
