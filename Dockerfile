FROM tomcat:9.0.73-jdk8-corretto
RUN yum update -y
RUN yum install maven git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
ADD pom.xml boxfuse-sample-java-war-hello/
WORKDIR /usr/local/tomcat/boxfuse-sample-java-war-hello/
RUN mvn package
RUN cp target/*.war /usr/local/tomcat/webapps/
