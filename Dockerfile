FROM tomcat:9.0.0

COPY /target/CVE-2020-1938.war /usr/local/tomcat/webapps/

RUN groupadd tomcat && \
    useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

RUN chown -R tomcat:tomcat /usr/local/tomcat/conf

RUN chgrp -R tomcat /usr/local/tomcat && \
    chmod -R g+x /usr/local/tomcat/conf && \
    chown -R tomcat /usr/local/tomcat/webapps/ /usr/local/tomcat/work/ /usr/local/tomcat/temp/ /usr/local/tomcat/logs/


USER "tomcat:tomcat"

EXPOSE 8080
EXPOSE 8009
EXPOSE 5005

ENV JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n"

ENV IMAGES_PATH $CATALINA_HOME/CVE-2020-1938/images

CMD ["catalina.sh", "run"]
