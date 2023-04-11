FROM tomcat:9.0.73-jdk8-corretto
RUN apt update
#RUN apt install default-jdk -y
RUN apt install maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
ADD pom.xml boxfuse-sample-java-war-hello/
#ADD pom.xml /usr/local/tomcat
WORKDIR /usr/local/tomcat/boxfuse-sample-java-war-hello/
#RUN cp pom.xml /usr/local/tomcat/
RUN mvn package
RUN cp target/*.war /usr/local/tomcat/webapps/

