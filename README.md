# Docker CodeClimate Test Reporter

[CodeClimate Test Reporter](https://github.com/codeclimate/test-reporter) in a Docker Container

## Usage

```bash
# build image locally
$ make dockerBuild
# test the image
$ make dockerTest
# go inside the container
$ make dockerShell
```

## Update Docker image

1. Apply the changes

> For version update, Makefile and Dockerfile need to be updated

1. Build and test locally `$ make dockerBuild dockerTest`
1. Commit and push
1. Run `$ make tag`
1. Go to [hub.docker.com](https://hub.docker.com/r/amaysim/codeclimate-test-reporter/)
1. In `Build Details` tab, you should now see the build kicking off

## Test with Code Climate

This repository contains a Go example to be used for testing test coverage and Code Climate.

1. Add this repository to Code Climate
    1. Select "Open source"
    1. then "Add a repository"
1. Get the "CC_TEST_REPORTER_ID"
    1. Go to "Settings"
    1. Go to "Test coverage"
1. Create a `.env` file based on `.env.template`
    1. The file should contain `CC_TEST_REPORTER_ID=the-id-from-settings`
1. Run the tests which will also send the report to Code Climate `$ make test`
1. Back to the Code Climate web site, you should see the coverage being 100%
1. Clean everything `$ make clean`
