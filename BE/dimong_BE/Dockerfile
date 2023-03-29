## 서버를 구동시킬 자바를 받아옵니다.
#FROM java:17
#
## `JAR_FILE` 이라는 이름으로 build 한 jar 파일을 지정합니다.
#ARG JAR_FILE=./build/libs/*.jar
#
## 지정한 jar 파일을 app.jar 라는 이름으로 Docker Container에 추가합니다.
#ADD ${JAR_FILE} app.jar
#
## app.jar 파일을 실행합니다.
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]


#FROM eclipse-temurin:17-jdk-alpine
#VOLUME /tmp
#ARG EXTRACTED=/workspace/app/target/extracted
#COPY ${EXTRACTED}/dependencies/ ./
#COPY ${EXTRACTED}/spring-boot-loader/ ./
#COPY ${EXTRACTED}/snapshot-dependencies/ ./
#COPY ${EXTRACTED}/application/ ./
#ENTRYPOINT ["java","org.springframework.boot.loader.JarLauncher"]

FROM joengenduvel/jre17 as builder
WORKDIR application
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} application.jar
RUN java -Djarmode=layertools -jar application.jar extract

FROM joengenduvel/jre17
WORKDIR application
ENV port 8086
ENV spring.profiles.active local
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/spring-boot-loader/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/application/ ./

ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]