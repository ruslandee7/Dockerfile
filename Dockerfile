ARG DEBIAN_FRONTEND=noninteractive
FROM ubuntu:18.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install maven tomcat9 git -y
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/
RUN cp /boxfuse-sample-java-war-hello/pom.xml /
RUN mvn package
RUN cp target/*.war /var/lib/tomcat9/webapps/