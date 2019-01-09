#!/usr/bin/env bash
#
# Prepare the image used for bootstrapping
#
set -x
set -e

cd "${SCRIPTS}/pharo" 

./pharo Pharo.image ${IMAGE_FLAGS} ${SCRIPTS}/prepare_image.st --save --quit
if [ $MANUAL = 1 ]; then
	./pharo Pharo.image ${IMAGE_FLAGS} ${SCRIPTS}/prepare_image_manual.st --save --quit
fi
cd -