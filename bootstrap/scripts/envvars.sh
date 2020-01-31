#!/usr/bin/env bash
#
# Set up environment variables used by the various
# bootstrap stages
#
# Required Input environment variables:
#
# - BUILD_NUMBER
# - BOOTSTRAP_ARCH
#
# Optional input environment variables:
#
# - BOOTSTRAP_CACHE
# - BOOTSTRAP_REPOSITORY
#

if [ -z "${BOOTSTRAP_REPOSITORY}" ]
then
  ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." ; pwd -P)"
  export BOOTSTRAP_REPOSITORY="${ROOT_DIR}"
else
  ROOT_DIR="$(pwd -P)"
fi

if [ -z "${BOOTSTRAP_CACHE}" ]
then
  BOOTSTRAP_CACHE=${ROOT_DIR}/bootstrap-cache
fi
export BOOTSTRAP_CACHE

# Ensure that BOOTSTRAP_REPOSITORY is propagated
# This is the VM used to bootstrap, i.e. the target VM
VM="${BOOTSTRAP_CACHE}/vmtarget/pharo --headless"

# Flags to run the image
IMAGE_FLAGS="--no-default-preferences"

# Include pharo version 
#. $(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)/envversion.sh
MANUAL=0
while [ "$1" != "" ]; do
    case $1 in
        -m | --manual )          
	        MANUAL=1
	        ;;
    esac
    shift
done

# For storing the repositories with the language definitions
if [ -z "${LANGUAGE_DEFINITIONS}" ]
then
  LANGUAGE_DEFINITIONS=${BOOTSTRAP_REPOSITORY}/bootstrap/language-definitions
fi
export LANGUAGE_DEFINITIONS

# For storing the pharo bootstrapper image and VM
if [ -z "${BOOTSTRAPPER}" ]
then
  BOOTSTRAPPER=${BOOTSTRAP_REPOSITORY}/bootstrap/bootstrapper
fi
export BOOTSTRAPPER
