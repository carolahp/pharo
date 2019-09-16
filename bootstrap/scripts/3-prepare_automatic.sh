cd "${SCRIPTS}/pharo"
./pharo Pharo.image ${IMAGE_FLAGS} ${SCRIPTS}/bootstrap.st --ARCH=${BOOTSTRAP_ARCH} --BUILD_NUMBER=${BUILD_NUMBER} --VERSION_INFO=`GIT_DIR=${BOOTSTRAP_REPOSITORY}/.git git describe --long --tags --abbrev=40` --quit
cd -