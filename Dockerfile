FROM node:latest
MAINTAINER Carl Hoyer <carl@pixolium.ca>

LABEL version="2.5.2"

# Update system
RUN apt-get -q -y update && apt-get -q -y upgrade

# Install FTP client
# NcFTP supports passing parameters via command-line (ncftpput) arguments - http://www.ncftp.com/ncftp/
RUN apt-get -q -y install ncftp

# Install GitBook
# https://github.com/GitbookIO/gitbook
RUN npm install -g gitbook-cli && gitbook versions:install 2.5.2

# Cleanup
RUN apt-get clean autoclean && npm cache clear && \
        rm -rf /tmp/* /var/lib/{apt,dpkg,cache,log}/*

WORKDIR /srv/gitbook

VOLUME /srv/gitbook /srv/html

# EXPOSE 4000

# CMD /usr/local/bin/gitbook serve
