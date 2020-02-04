#!/usr/bin/env bash
#
# Download resources required for bootstrap process
#
set -x
set -e

mkdir -p "${BOOTSTRAP_CACHE}" #required to generate hermes files
mkdir -p "${BOOTSTRAPPER}" #for storing the bootstrap image files 
mkdir -p "${LANGUAGE_DEFINITIONS}" #for storing the language definitions used to define the bootstrapped images
cd ${BOOTSTRAPPER}

${SCRIPTS}/getPharoVM.sh 70
wget https://github.com/carolahp/PharoBootstrap/releases/download/v2.0.2/bootstrapImage.zip
unzip -o bootstrapImage.zip

cd ${LANGUAGE_DEFINITIONS}
wget https://github.com/carolahp/PharoCandleSrc/archive/v1.1.zip
unzip -o v1.1

cd 