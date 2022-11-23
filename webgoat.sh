#! /bin/sh

PROJECT_ROOT=$(dirname $(realpath $0 ))
CATALINA_HOME=$PROJECT_ROOT/tomcat
PATH=${PATH}:$PROJECT_ROOT/tomcat/bin
export CATALINA_HOME PATH

chmod +x $CATALINA_HOME/bin/*.sh

start() {
    cp -f $CATALINA_HOME/conf/server_8080.xml $CATALINA_HOME/conf/server.xml
    sed -i 's/address="127.0.0.1"//' $CATALINA_HOME/conf/server.xml
    $CATALINA_HOME/bin/startup.sh
    printf "\n  Open http://127.0.0.1:8080/webgoat/attack"
    printf "\n  Username: guest"
    printf "\n  Password: guest"
    printf "\n  Or try http://guest:guest@127.0.0.1:8080/webgoat/attack \n\n\r"
    sleep 2
    tail -f $CATALINA_HOME/logs/catalina.out
}

stop() {
    $CATALINA_HOME/bin/shutdown.sh
}

start
