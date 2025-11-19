FROM openjdk:17-jre-slim
WORKDIR /app
COPY target/jenkins-java-app-1.0-SNAPSHOT.jar app.jar 
ENTRYPOINT [ "java", "-jar", "app.jar" ]
