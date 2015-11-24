# GitBook Build & Deploy

Inspired by [fallah/gitbook](https://hub.docker.com/r/fellah/gitbook/)

Primarily meant to be used in a CI environment (e.g. Gitlab CI) to build and deploy Gitbook via FTP.

Sample Gitlab CI ` .gitlab-ci.yml` config to build and deploy static site via ftp:

```
image: choyer/gitbook-deploy

Gitbook Build & Deploy Static Site:
  script:
    - gitbook build
    - ls _book
    - ncftpput -R -v -u $FTP_USERNAME -p $FTP_PASSWORD ftp.yourdomain.com /ftp_dir _book/*

  only:
    - master
```
