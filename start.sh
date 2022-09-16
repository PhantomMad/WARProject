#!/usr/bin/env bash
if [ `ls  distr/ | wc -l` -gt 0 ]; then
 mv distr/*.* tomcat/webapps/
fi
tomcat/bin/startup.sh run && tail -f tomcat/logs/catalina.out
