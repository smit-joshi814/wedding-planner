# Use an official GraalVM image as a parent image
FROM oracle/graalvm-ce:21

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file into the container
COPY target/wedding-planner-image-new.jar /app/wedding-planner-image-new.jar

# Copy the entire project directory into the container
COPY . /app

# Expose the port the app runs on
EXPOSE 8080

# Set environment variables for database configuration
ENV SPRING_DATASOURCE_URL=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}
ENV SPRING_DATASOURCE_USERNAME=${DB_USERNAME}
ENV SPRING_DATASOURCE_PASSWORD=${DB_PASSWORD}

# Specify the command to run on container start
CMD ["java", "-jar", "wedding-planner-image-new.jar"]
