#!/bin/sh

./bin/startup.sh
sleep 2
printf "\n  Open http://127.0.0.1:8080/WebGoat/attack"
printf "\n  Username: guest"
printf "\n  Password: guest"
printf "\n  Or try http://guest:guest@127.0.0.1:8080/WebGoat/attack \n\n\r"
tail -f ./logs/catalina.out
