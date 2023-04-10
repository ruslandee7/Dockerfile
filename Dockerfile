FROM tomcat:7.0
RUN apt update
#RUN apt install default-jdk -y
RUN apt install maven git -y
EXPOSE 8080
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
ADD pom.xml boxfuse-sample-java-war-hello/
ADD pom.xml /usr/local/tomcat
RUN cd boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp target/*.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]