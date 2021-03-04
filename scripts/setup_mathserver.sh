#!/bin/sh

# This setups up a math server to run the simulation.
#
# Run the following command at the top of the repository:
# $ . ./scripts/setup_mathserver.sh
#
# This downloads java runtime if necessary
# and sets `JAVA_RUNTIME` environment variable
# which is used in `run_match.sh`.

# Directory where java runtime is downloaded.
JAVA_DIR=lib/openjdk

echo $(pwd)

if [ ! -d "${JAVA_DIR}" ]; then
    # Java not found.
    echo "Downloading JDK"
    mkdir -p ${JAVA_DIR}
    pushd ${JAVA_DIR}
    wget https://download.java.net/java/GA/jdk15.0.2/0d1cfde4252546c6931946de8db48ee2/7/GPL/openjdk-15.0.2_linux-x64_bin.tar.gz
    tar -xf openjdk-15.0.2_linux-x64_bin.tar.gz
    rm openjdk-15.0.2_linux-x64_bin.tar.gz
    popd
fi

export JAVA_RUNTIME=./${JAVA_DIR}/jdk-15.0.2/bin/java
