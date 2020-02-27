#!/usr/bin/env bash
#
# Download resources required for bootstrap process
#
# See envvars.sh for input environment variables
#
set -x
set -e

SCRIPTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)"

. ${SCRIPTS}/envvars.sh

mkdir -p "${BOOTSTRAP_CACHE}" #required to generate hermes files
mkdir -p "${BOOTSTRAPPER}" #for storing the bootstrap image files 
mkdir -p "${LANGUAGE_DEFINITIONS}" #for storing the language definitions used to define the bootstrapped images
mkdir -p "${BOOTSTRAPPED_IMAGES}"
cd "${BOOTSTRAPPER}"

${SCRIPTS}/getPharoVM.sh 80 vm 64
wget https://github.com/carolahp/PharoBootstrap/releases/download/v2.0.3/bootstrapper.zip
unzip -o bootstrapper.zip

cd "${LANGUAGE_DEFINITIONS}"
wget https://github.com/carolahp/PharoCandleSrc/archive/v1.1.zip
unzip -o v1.1

cd "${BOOTSTRAP_CACHE}"
#We need the old sources file next to the image because of sources condensation step
wget --progress=dot:mega http://files.pharo.org/sources/PharoV60.sources
echo "Prepare icons"
mkdir icon-packs
cd icon-packs
# update the commit hash as soon as you need a new version of the icons to be loaded
wget --progress=dot:mega https://github.com/pharo-project/pharo-icon-packs/archive/v1.0.0-idea11.zip -O idea11.zip
cd ..
cd ..

if [ -z "${BOOTSTRAP_VMTARGET}" ]
then
    # Downloads a SPUR vm for the configured architecture
    mkdir ${BOOTSTRAP_CACHE}/vmtarget
    cd ${BOOTSTRAP_CACHE}/vmtarget
    ${BOOTSTRAP_REPOSITORY}/bootstrap/scripts/getPharoVM.sh 70 vm $BOOTSTRAP_ARCH
    cd -
fi
echo "Target VM: $(${VM} --version | grep Hash)"

cd "${BOOTSTRAPPED_IMAGES}"
# The VM used to run our generated images
${SCRIPTS}/getPharoVM.sh 80 vm 32