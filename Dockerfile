FROM wordpress:cli-php7.4
USER root
RUN apk add --no-cache \
  openssh-client \
  lftp
COPY lftp-config /etc/lftp.conf
COPY get-credentials /usr/local/bin/get-credentials
COPY download-db /usr/local/bin/download-db
COPY download-directory /usr/local/bin/download-directory
COPY download-plugins /usr/local/bin/download-plugins
COPY download-themes /usr/local/bin/download-themes
COPY download-uploads /usr/local/bin/download-uploads
COPY import-db /usr/local/bin/import-db
COPY backup /usr/local/bin/backup
COPY restore /usr/local/bin/restore
COPY restore-dir /usr/local/bin/restore-dir
COPY multisite-import-db /usr/local/bin/multisite-import-db
COPY multisite-init /usr/local/bin/multisite-init
COPY wp-init /usr/local/bin/wp-init
RUN chmod a+x \
  /usr/local/bin/get-credentials     \
  /usr/local/bin/download-db         \
  /usr/local/bin/download-directory  \
  /usr/local/bin/download-plugins    \
  /usr/local/bin/download-themes     \
  /usr/local/bin/download-uploads    \
  /usr/local/bin/import-db           \
  /usr/local/bin/backup              \
  /usr/local/bin/restore             \
  /usr/local/bin/restore-dir         \
  /usr/local/bin/multisite-import-db \
  /usr/local/bin/multisite-init      \
  /usr/local/bin/wp-init
ENTRYPOINT sh
USER www-data
