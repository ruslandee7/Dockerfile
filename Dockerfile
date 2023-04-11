FROM tomcat:9.0.41-jdk11-openjdk-slim-buster
RUN apt update
#RUN apt install default-jdk -y
RUN apt install maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
#ADD pom.xml boxfuse-sample-java-war-hello/
#ADD pom.xml /usr/local/tomcat
RUN cd boxfuse-sample-java-war-hello/
#RUN cp pom.xml /usr/local/tomcat/
RUN mvn package
RUN cp target/*.war /usr/local/tomcat/webapps/

