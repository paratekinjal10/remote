FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM openjdk
WORKDIR /app
COPY --from=build /app/target/devops-integration.jar /app/devops-integration.jar
EXPOSE 8085
ENTRYPOINT ["java","-jar","devops-integration.jar"]
CMD  ["java","-jar","devops-integration.jar"]
