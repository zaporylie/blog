FROM drupaldocker/php:7.2-cli-2.x

# Default user uid for ubuntu users
ARG UID=1000
ARG GID=1000

# Default username of newly created user and group in within the container.
ARG NAME=drupal

RUN addgroup -g ${GID} ${NAME} \
 && adduser -D -u ${UID} -G ${NAME} ${NAME} \
 && adduser ${NAME} www-data

USER ${UID}
