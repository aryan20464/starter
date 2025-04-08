FROM eclipse-temurin:17-alpine

# Set the timezone
ENV TZ=Asia/Dhaka
RUN apk add --no-cache tzdata && \
    cp /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone

# Create group and user
RUN addgroup --system --gid 1001 itss && \
    adduser --system --uid 1001 --ingroup itss itss

# Create application directories
RUN mkdir -p /app/logs && \
    mkdir -p /var/log/app-logs

# Set ownership and permissions
RUN chown -R itss:itss /app /var/log/app-logs && \
    chmod -R 775 /app/logs /var/log/app-logs

# Set working directory
WORKDIR /app

# Copy application jar
COPY target/Starter.jar Starter.jar
RUN chown itss:itss Starter.jar

# Switch to non-root user
USER itss

# Expose port
EXPOSE 4202

# Entry point
ENTRYPOINT ["java", "-jar", "Starter.jar"]