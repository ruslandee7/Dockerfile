FROM ubuntu:18.04
RUN apt update
RUN apt install maven tomcat9 git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/
RUN cp /boxfuse-sample-java-war-hello/pom.xml /
RUN mvn package
RUN cp target/*.war /var/lib/tomcat9/webapps/
EXPOSE 8080
#CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]
RUN service tomcat9 start