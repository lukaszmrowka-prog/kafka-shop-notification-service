# syntax=docker/dockerfile:1.7
FROM maven:3.9.9-eclipse-temurin-17 AS build
WORKDIR /src
COPY pom.xml .
COPY src src
RUN --mount=type=cache,target=/root/.m2 mvn -B -q -DskipTests package && cp target/*-1.0-SNAPSHOT.jar /src/app.jar

FROM eclipse-temurin:17.0.13_11-jre
# OpenTelemetry Java agent; it is attached at run time through JAVA_TOOL_OPTIONS.
ADD --checksum=sha256:d05f6e36fac8db629263a6aaec2841cc934d064d7b19bfe38425b604b8b54926 \
    https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v2.10.0/opentelemetry-javaagent.jar \
    /otel/opentelemetry-javaagent.jar
COPY --from=build /src/app.jar /app/app.jar
WORKDIR /app
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
