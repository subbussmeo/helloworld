# Pull Base Image 
From docker.io/tomcat:8-jre8 

# Maintainer by the user 
MAINTAINER "subbu" 

#Whom to exeute the commands
USER root
COPY . ./
#RUN mvn clean package

#copy the artifatory to tomcat webapp loation
COPY ./webapp/target/*.war /usr/local/tomcat/webapps
#RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
