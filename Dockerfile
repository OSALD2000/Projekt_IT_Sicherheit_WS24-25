FROM maven:latest AS build

COPY . /app

WORKDIR /app/trunk

RUN mvn clean package

FROM tomcat:9.0.0

COPY --from=build /app/trunk/target/document_management.war /usr/local/tomcat/webapps/

EXPOSE 8080
EXPOSE 8009

CMD ["catalina.sh", "run"]
