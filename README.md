> [!WARNING]
> On **Feb 14, 2023**, GitBook [announced the deprecation](https://github.com/GitbookIO/gitbook-cli/commit/6d9b3b894b5da9aaf94027b8661fdd522bbb779d) of [gitbook-cli](https://github.com/GitbookIO/gitbook-cli). As a result use at your own risk!

# GitBook Build & Deploy

Ideal for use in a CI environment (e.g. Gitlab CI) to a) build and b) deploy Gitbook via FTP using [NcFTP](http://www.ncftp.com/ncftp/) which supports passing parameters via the command-line tool `ncftpput`.

Inspired by [fallah/gitbook](https://hub.docker.com/r/fellah/gitbook/)

Available on Docker Hub: https://hub.docker.com/r/choyer/gitbook-deploy/

Version sync'd with GitBook beginning with version 3.0.0

`docker pull choyer/gitbook-deploy`

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

  artifacts:
    untracked: true
```

Where `$FTP_USERNAME` and `$FTP_PASSWORD` are [Gitlab project user defined variables](http://doc.gitlab.com/ci/variables/README.html#user-defined-variables-secure-variables).
