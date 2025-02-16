FROM tomcat:9-jdk11  
COPY . /usr/local/tomcat/webapps/phonebook  
EXPOSE 8080  
CMD ["catalina.sh", "run"]