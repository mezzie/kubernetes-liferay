#!/bin/bash

function main {
	echo ""
	echo "[LIFERAY] Starting ${LIFERAY_PRODUCT_NAME}. To stop the container with CTRL-C, run this container with the option \"-it\"."
	echo ""

	if [ "${LIFERAY_OSGI_SAVE}" == "true" ]
	then
		rsync -haz /opt/liferay/osgi/ /opt/liferay/osgi2/ && \
		rm -rf /opt/liferay/osgi && \
		ln -s /opt/liferay/osgi2 /opt/liferay/osgi
	fi

	if [ "${LIFERAY_JPDA_ENABLED}" == "true" ]
	then
		${LIFERAY_HOME}/${TOMCAT_FOLDER}/bin/catalina.sh jpda run
	else
		${LIFERAY_HOME}/${TOMCAT_FOLDER}/bin/catalina.sh run
	fi
}

main