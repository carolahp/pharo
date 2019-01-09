#!/usr/bin/env bash
#
# Download resources required for bootstrap process
#
set -x
set -e

mkdir -p "${BOOTSTRAP_CACHE}" #required to generate hermes files
mkdir -p "${SCRIPTS}/pharo" #for storing the bootstrap image files 
cd ${SCRIPTS}/pharo

${SCRIPTS}/getPharoVM.sh 70
wget https://github.com/carolahp/PharoBootstrap/releases/download/v1.7.0/bootstrapImage.zip
unzip -o bootstrapImage.zip

cd -