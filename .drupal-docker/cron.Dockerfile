FROM drupaldocker/php:7.4-cli-2.x

# Default user uid for ubuntu users
ARG UID=1000
ARG GID=1000

# Default username of newly created user and group in within the container.
ARG NAME=drupal

RUN addgroup -g ${GID} ${NAME} \
 && adduser -D -u ${UID} -G ${NAME} ${NAME} \
 && adduser ${NAME} www-data

# Add crontab file in the cron directory
ADD .drupal-docker/crontab /usr/share/crontab
RUN touch /var/log/cron.log && chmod a+wr /var/log/cron.log

# Create the log file to be able to run tail
RUN crontab -u ${NAME} /usr/share/crontab

# Run the command on container startup
CMD /usr/sbin/crond -L /var/log/cron.log -b && tail -f /var/log/cron.log
