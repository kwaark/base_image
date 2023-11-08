# base_image/Dockerfile
FROM python:3.9

# Install poetry
RUN pip install poetry

# Copy the self-signed certificate to the container
COPY ./cert.pem /usr/local/share/ca-certificates/cert.crt

# Update the CA certificates system
RUN update-ca-certificates

# Set the working directory
WORKDIR /app

# Health check (replace with your actual health check endpoint if different)
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl --fail http://localhost:8000/health || exit 1
