#!/bin/bash

set -o xtrace   # Write all commands first to stderr
set -o errexit  # Exit the script with error if any of the commands fail

# Supported/used environment variables:
# SCALA_VERSION   The Scala version to compile with
# SPARK_VERSION   The spark version to test against
SCALA_VERSION=${SCALA_VERSION:-2.12}
SPARK_VERSION=${SPARK_VERSION:-3.1.2}

export JAVA_HOME="/opt/java/jdk11"

############################################
#            Main Program                  #
############################################

echo "Running unit tests on JDK${JAVA_VERSION}"

./gradlew -version
./gradlew --stacktrace --info test -DscalaVersion=$SCALA_VERSION -DsparkVersion=$SPARK_VERSION
