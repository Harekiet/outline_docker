FROM alpine
#Prepare apt packages
RUN apk add --no-cache curl

# Copy cron file to the cron.d directory
COPY php.cron /etc/cron.d/cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cron

# Apply cron job
RUN crontab /etc/cron.d/cron

# Create the log file to be able to run tail
RUN mkdir -p /var/log/cron

ENTRYPOINT [ "/usr/sbin/crond", "-f"]
