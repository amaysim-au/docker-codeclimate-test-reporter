# Docker CodeClimate Test Reporter

[CodeClimate Test Reporter](https://github.com/codeclimate/test-reporter) in a Docker Container

## Usage

```bash
# build image locally
$ make build
# test the image
$ make test
# go inside the container
$ make shell
```

## Update Docker image

1. Apply the changes

> For version update, Makefile and Dockerfile need to be updated

1. Build and test locally `$ make build test`
1. Commit and push
1. Run `$ make tag`
1. Go to [hub.docker.com](https://hub.docker.com/r/amaysim/codeclimate-test-reporter/)
1. In `Build Details` tab, you should now see the build kicking off