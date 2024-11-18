FROM tomcat:9.0.0

COPY /target/CVE-2020-1938.war /usr/local/tomcat/webapps/

EXPOSE 8080
EXPOSE 8009

ENV IMAGES_PATH $CATALINA_HOME/CVE-2020-1938/images

CMD ["catalina.sh", "run"]
