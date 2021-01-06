#!/bin/bash

function main {
	if [ -n "${JAVA_VERSION}" ]
	then
		if [ -e "/usr/local/openjdk-8" ]
		then
			JAVA_HOME=/usr/local/openjdk-8
			PATH=${JAVA_HOME}/bin/:${PATH}

			echo "[LIFERAY] Using ${JAVA_VERSION} JDK. You can use another JDK by setting the \"JAVA_VERSION\" environment varible."
			echo ""
		else
			echo "[LIFERAY] \"${JAVA_VERSION}\" JDK is not available in this Docker image."
			echo ""

			exit 1
		fi
	fi
}

main