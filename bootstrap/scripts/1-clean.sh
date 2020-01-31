#!/bin/bash
#
# Remove any artifacts from previous bootstrap runs
#
set -x
set -e

rm -rf "${BOOTSTRAPPER}"
rm -rf "${BOOTSTRAP_CACHE}"
rm -rf "${LANGUAGE_DEFINITIONS}"