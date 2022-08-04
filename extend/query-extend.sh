#!/bin/sh

JLINE_VERSION=3.20.0
COH_VERSION=22.06.1
set -e

mvn -DgroupId=com.oracle.coherence.ce -DartifactId=coherence -Dversion=${COH_VERSION} dependency:get
mvn -DgroupId=org.jline -DartifactId=jline -Dversion=${JLINE_VERSION} dependency:get

COHERENCE_JAR=$HOME/.m2/repository/com/oracle/coherence/ce/coherence/${COH_VERSION}/coherence-${COH_VERSION}.jar:$HOME/.m2/repository/org/jline/jline/${JLINE_VERSION}/jline-${JLINE_VERSION}.jar:`pwd`

java -cp $COHERENCE_JAR -Dtangosol.coherence.tcmp.enabled=false -Dtangosol.coherence.cacheconfig=extend-client-cache-config.xml com.tangosol.coherence.dslquery.QueryPlus "$@"

