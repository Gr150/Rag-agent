# Use the official Python 3.11 slim image as the base
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the agent application code into the container
COPY agent_app/ ./agent_app/

# Set the working directory to the agent directory
WORKDIR /app/agent_app

# Install dependencies
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose the port Cloud Run will use
EXPOSE 8080

# Set environment variables (optional, can also be set in Cloud Run UI)
# ENV GOOGLE_CLOUD_PROJECT=your-project-id
# ENV GOOGLE_CLOUD_LOCATION=us-central1

# Command to run your agent (update if your entrypoint is different)
CMD ["python", "-m", "agent"] 