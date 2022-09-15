FROM alpine:latest
RUN apk --no-cache update \
    && apk --no-cache add openjdk11 bash tar
WORKDIR /opt
RUN mkdir tomcat/ \
    && mkdir distr/
COPY apache-tomcat-10.0.23.tar.gz distr/
RUN tar xpvf distr/apache-tomcat-*.tar.gz -C tomcat/ --strip-components=1 \
    && rm -f distr/apache-tomcat-*.tar.gz
ADD webapps distr/
RUN export JAVA_HOME=$(readlink -f /usr/bin/java | sed 's:/bin/java::')
ENV JRE_HOME=${JAVA_HOME}
ENV PATH=$PATH:$JAVA_HOME/bin
ENV CATALINA_PID=/opt/tomcat/temp/tomcat.pid
ENV CATALINA_OPTS="-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
COPY start.sh .
EXPOSE 8080
RUN ["chmod", "+x", "./start.sh"]
#ENTRYPOINT ["./start.sh"]
