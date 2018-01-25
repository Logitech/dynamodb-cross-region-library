FROM maven:3.5.2-jdk-8

# Create app directory
WORKDIR /usr/src/app

# Build
COPY . .

RUN mvn install

CMD java -jar target/dynamodb-cross-region-replication-1.2.1.jar --sourceRegion us-east-1 --sourceTable ${REPL_SOURCE} --sourceRoleArn ${REPL_ROLE_ARN} --destinationRegion us-east-1 --destinationTable ${REPL_DEST} --taskName ${REPL_TASK}


