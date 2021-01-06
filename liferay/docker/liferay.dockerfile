FROM openjdk:8-jdk
ENV JPDA_ADDRESS=8000
ENV LIFERAY_DISABLE_TRIAL_LICENSE=false
ENV LIFERAY_HOME=/opt/liferay
ENV TOMCAT_FOLDER=tomcat-8.0.32
ENV LIFERAY_JPDA_ENABLED=true
ENV LIFERAY_OSGI_SAVE=true
ENV LIFERAY_JVM_OPTS=
ENV LIFERAY_PRODUCT_NAME="${LABEL_NAME}"

ENV LIFERAY_MODULE_PERIOD_FRAMEWORK_PERIOD_PROPERTIES_PERIOD_OSGI_PERIOD_CONSOLE=0.0.0.0:11311
ENV LIFERAY_SETUP_PERIOD_WIZARD_PERIOD_ADD_PERIOD_SAMPLE_PERIOD_DATA=false
ENV LIFERAY_SETUP_PERIOD_WIZARD_PERIOD_ENABLED=false
ENV LIFERAY_TERMS_PERIOD_OF_PERIOD_USE_PERIOD_REQUIRED=false
ENV LIFERAY_USERS_PERIOD_REMINDER_PERIOD_QUERIES_PERIOD_ENABLED=false

EXPOSE 8000 8009 8080 11311

COPY scripts/* /usr/local/bin/
WORKDIR /opt
COPY liferay.zip ./

RUN adduser --home /home/liferay liferay && addgroup liferay liferay && \
    apt-get update && \
    apt-get --yes install bash curl ghostscript imagemagick tree ttf-dejavu dos2unix rsync && \
    rm -rf /var/lib/apt/lists/* && \
    find /usr/local/bin -type f -print0 | xargs -0 dos2unix && \
    unzip liferay.zip && \
    rm -rf liferay.zip && \
    mv liferay* liferay && \
    ln -s /opt/liferay/tomcat* /opt/liferay/tomcat

ENTRYPOINT ["/usr/local/bin/liferay_entrypoint.sh"]