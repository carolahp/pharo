#!/bin/bash
#
# Remove any artifacts from previous bootstrap runs
#
set -x
set -e

SCRIPTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)"

. ${SCRIPTS}/envvars.sh

rm -rf "${BOOTSTRAPPER}"
rm -rf "${BOOTSTRAP_CACHE}"
rm -rf "${LANGUAGE_DEFINITIONS}"
rm -rf "${BOOTSTRAPPED_IMAGES}"