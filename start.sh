#!/usr/bin/env bash
if [ `ls  distr/webapps/ | wc -l` -gt 0 ]; then
 mv distr/webapps/*.* tomcat/webapps/
fi
tomcat/bin/startup.sh run && tail -f tomcat/logs/catalina.out
