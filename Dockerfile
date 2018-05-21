FROM wordpress:cli-php7.1
USER root
RUN apk add --no-cache \
  openssh-client \
  lftp
COPY lftp-config /home/www-data/.lftprc
COPY check-credentials /usr/local/bin/check-credentials
COPY download-db /usr/local/bin/download-db
COPY download-directory /usr/local/bin/download-directory
COPY download-plugins /usr/local/bin/download-plugins
COPY download-uploads /usr/local/bin/download-uploads
COPY import-db /usr/local/bin/import-db
COPY backup.sh /usr/local/bin/backup
COPY restore.sh /usr/local/bin/restore
USER www-data
