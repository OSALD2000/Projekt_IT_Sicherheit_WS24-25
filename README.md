# RUN TO RUN

docker build . --tag it-sicherheit-projekt

docker run --name tomcat -p 8080:8080 -p 8009:8009 -h tomcat-test  it-sicherheit-projekt

with -d to run in background