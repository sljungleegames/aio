# Use the official Python 3.8 base image as the starting point
FROM python:3.8

# Update the package index and install cron and supervisor inside the container
RUN apt-get update && apt-get install -y cron supervisor

# Set the working directory to /app inside the container
WORKDIR /app

# Copy the requirements.txt file from the host to the container's /app directory
COPY requirements.txt .

# Install the Python dependencies listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy all the files from the host's current directory to the container's /app directory
COPY . .

# Add the crontab file to /etc/cron.d/orchestrator inside the container
ADD ./cron/crontab /etc/cron.d/orchestrator

# Set the appropriate permissions for the crontab file and shell scripts in the /app/cron directory
RUN chmod 0644 /etc/cron.d/orchestrator && \
    chmod +x ./cron/*.sh

# Create an empty cron.log file at /var/log/cron.log inside the container
RUN touch /var/log/cron.log

# Copy the supervisord.conf file from the host to /etc/ inside the container
COPY ./cron/supervisord.conf /etc/

# Expose port 5000 to the host machine so it can access the container's service
EXPOSE 5000

# Set the command to be executed when the container starts
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]