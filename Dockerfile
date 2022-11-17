FROM tomcat:7-alpine

RUN wget -qO webapps/WebGoat.war https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/webgoat/WebGoat-5.4.war
COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY webgoat.sh /usr/local/tomcat/webgoat.sh

WORKDIR /usr/local/tomcat
EXPOSE 8080

ENTRYPOINT [ "./webgoat.sh" ]