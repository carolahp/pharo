#!/bin/bash
#
# Remove any artifacts from previous bootstrap runs
#
set -x
set -e

rm -rf "${SCRIPTS}/pharo"
#rm -f bootstrapImage.zip
#rm -f Pharo.image Pharo.changes pharo pharo-ui Pharo*.sources
#rm -rf pharo-vm
#rm -rf pharo-local
rm -rf "${BOOTSTRAP_CACHE}"