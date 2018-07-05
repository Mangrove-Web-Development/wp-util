FROM wordpress:cli-php7.1
USER root
RUN apk add --no-cache \
  openssh-client \
  lftp
COPY lftp-config /etc/lftp.conf
COPY get-credentials /usr/local/bin/get-credentials
COPY download-db /usr/local/bin/download-db
COPY download-directory /usr/local/bin/download-directory
COPY download-plugins /usr/local/bin/download-plugins
COPY download-uploads /usr/local/bin/download-uploads
COPY import-db /usr/local/bin/import-db
COPY backup /usr/local/bin/backup
COPY restore /usr/local/bin/restore
COPY restore-dir /usr/local/bin/restore-dir
RUN chmod a+x \
  /usr/local/bin/get-credentials  \
  /usr/local/bin/download-db        \
  /usr/local/bin/download-directory \
  /usr/local/bin/download-plugins   \
  /usr/local/bin/download-uploads   \
  /usr/local/bin/import-db          \
  /usr/local/bin/backup             \
  /usr/local/bin/restore            \
  /usr/local/bin/restore-dir
ENTRYPOINT sh
