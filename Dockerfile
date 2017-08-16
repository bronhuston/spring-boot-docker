FROM openjdk:8-jdk-alpine

VOLUME /tmp
# Copy local package files to the container's workspace
ADD . .

# Build jar inside the container
RUN ./gradlew build

ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /build/libs/gs-spring-boot-docker.jar" ]

EXPOSE 8080