FROM openjdk:8-jdk-alpine 
# Refer to Maven build -> finalName 
WORKDIR /opt/app 
COPY target/helloworld.jar app.jar 
# java -jar /opt/app/app.jar 
ENTRYPOINT ["java","-jar","app.jar"] 
