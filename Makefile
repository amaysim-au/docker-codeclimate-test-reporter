CODECLIMATE_TEST_REPORTER_VERSION = 0.5.0
IMAGE_NAME ?= amaysim/codeclimate-test-reporter:$(CODECLIMATE_TEST_REPORTER_VERSION)
PROFILE_NAME ?= c.out

####################################
# Code Climate Test Reporter Image #
####################################

dockerBuild:
	docker build --no-cache -t $(IMAGE_NAME) .
.PHONY: dockerBuild

dockerTest:
	docker run --rm -it $(IMAGE_NAME) /cc-test-reporter -v
.PHONY: dockerTest

shell:
	docker run --rm -it -v $(PWD):/opt/app --entrypoint sh --workdir /opt/app $(IMAGE_NAME)
.PHONY: shell

tag:
	-git tag -d $(CODECLIMATE_TEST_REPORTER_VERSION)
	-git push origin :refs/tags/$(CODECLIMATE_TEST_REPORTER_VERSION)
	git tag $(CODECLIMATE_TEST_REPORTER_VERSION)
	git push origin $(CODECLIMATE_TEST_REPORTER_VERSION)
.PHONY: tag

###########
# Example #
###########

test:
	docker-compose run --rm golang make _test
	docker-compose run --rm codeclimate _sendToCodeClimate
.PHONY: test

clean:
	docker-compose down --remove-orphans
	rm $(PROFILE_NAME)
.PHONY: clean

_test:
	go test -coverprofile=$(PROFILE_NAME) ./...
.PHONY: _test

_sendToCodeClimate:
	@if [ ! -z "$(CC_TEST_REPORTER_ID)" ]; then \
		echo "Sending code climate test coverage";\
		/cc-test-reporter after-build --prefix github.com/amaysim-au/docker-codeclimate-test-reporter;\
	else\
		echo "Skip sending code climate test coverage because CC_TEST_REPORTER_ID is not set";\
	fi;
.PHONY: _sendToCodeClimate