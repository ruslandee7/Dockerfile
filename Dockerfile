FROM tomcat:8.0
RUN apt update
#RUN apt install default-jdk -y
RUN apt install maven git -y
EXPOSE 8080
CMD ["catalina.sh", "run"]
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
ADD pom.xml boxfuse-sample-java-war-hello/
ADD pom.xml /usr/local/tomcat
RUN cd boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp target/*.war /webapps/