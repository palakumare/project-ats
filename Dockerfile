# =====================================================================
# Recruitment and Applicant Tracking System
# Production Multi-Stage Dockerfile
# =====================================================================

# Stage 1: Build Frontend (React + Vite)
FROM node:20-alpine AS frontend-builder
WORKDIR /app/frontend
COPY frontend/package.json frontend/package-lock.json* ./
RUN npm ci || npm install
COPY frontend/ ./
RUN npm run build

# Stage 2: Build Backend (Java Spring Boot)
FROM maven:3.9.6-eclipse-temurin-21-alpine AS backend-builder
WORKDIR /app/backend
COPY backend/pom.xml ./
RUN mvn dependency:go-offline -B
COPY backend/src ./src

# Copy built frontend assets into Spring Boot static directory
COPY --from=frontend-builder /app/frontend/dist/ ./src/main/resources/static/

RUN mvn clean package -DskipTests

# Stage 3: Production Runtime
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Create directory for file uploads
RUN mkdir -p uploads/resumes

# Copy executable jar from backend-builder
COPY --from=backend-builder /app/backend/target/*.jar app.jar

# Expose server port
EXPOSE 8080

# Environment defaults
ENV PORT=8080
ENV SPRING_PROFILES_ACTIVE=prod

# Run application
ENTRYPOINT ["java", "-jar", "-Dserver.port=${PORT}", "app.jar"]
