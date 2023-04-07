FROM ubuntu:18.04
RUN apt update
RUN apt install maven -y
RUN apt install tomcat9 -y
RUN apt install git -y
EXPOSE 8080
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp target/*.war /var/lib/tomcat9/webapps/
