FROM gradle:9.1.0-jdk25
WORKDIR /home/gradle/project
VOLUME ["/home/gradle/project"]
EXPOSE 8080
CMD ["/bin/sh", "-c", "./gradlew bootRun"]
