#!/usr/bin/env bash
#
# Prepare the image used for bootstrapping
#
set -x
set -e

SCRIPTS="$(cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P)"

. ${SCRIPTS}/envvars.sh

set_version_variables

cd "${BOOTSTRAPPER}" 

./pharo Pharo.image ${IMAGE_FLAGS} ${SCRIPTS}/prepare_image.st --save --quit
if [ $MANUAL = 1 ]; then
	./pharo Pharo.image ${IMAGE_FLAGS} ${SCRIPTS}/prepare_image_manual.st --save --quit
	# Open image for continue the process manually using the pharo ui
	. ${SCRIPTS}/prepare_manual.sh 
else
	# Perform bootstrap in headless mode
	. ${SCRIPTS}/prepare_automatic.sh 
fi

cd -