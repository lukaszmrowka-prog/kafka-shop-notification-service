# kafka-shop-notification-service

Customer notifications for order events.

Part of **Kafka Shop**, a small e-commerce system made of Spring Boot microservices that talk over HTTP and
Kafka. To run the whole shop with Kafka, the databases and the observability stack, see
[kafka-shop-platform](https://github.com/lukaszmrowka-prog/kafka-shop-platform).

| | |
|---|---|
| Port | 8088 |
| Data store | none |
| Calls over HTTP | none |
| Consumes from Kafka | `notificationTopic` |
| Publishes to Kafka | none |

## Build and run

```bash
mvn -DskipTests package            # Java 17
docker build -t kafka-shop/notification-service .
```

Spring Boot 3.1.4, Spring Cloud 2022.0.4. The image includes the OpenTelemetry Java agent; it is enabled
with `JAVA_TOOL_OPTIONS=-javaagent:/otel/opentelemetry-javaagent.jar`.

## Origin

Split out of [Kharzixen/Microservices-Project-With-Kafka](https://github.com/Kharzixen/Microservices-Project-With-Kafka) (module
`Microservices-parent/notification-service`), with that module's git history.
