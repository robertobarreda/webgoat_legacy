FROM openjdk:7-jre-alpine

ENV WEBGOAT_URL https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/webgoat/WebGoat-OWASP_Standard-5.3_RC1.7z

RUN wget -qO webgoat.zip $WEBGOAT_URL && \
    apk --no-cache add p7zip && \
    7z x webgoat.zip && \
    rm webgoat.zip

WORKDIR /WebGoat-5.3_RC1

COPY webgoat.sh webgoat.sh

EXPOSE 8080

CMD [ "./webgoat.sh" ]
