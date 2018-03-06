CODECLIMATE_TEST_REPORTER_VERSION = 0.5.0
IMAGE_NAME ?= amaysim/codeclimate-test-reporter:$(CODECLIMATE_TEST_REPORTER_VERSION)

pull:
	docker pull $(IMAGE_NAME)
.PHONY: pull

build:
	docker build --no-cache -t $(IMAGE_NAME) .
.PHONY: build

test:
	docker run --rm -it $(IMAGE_NAME) -v
.PHONY: test

shell:
	docker run --rm -it -v $(PWD):/opt/app --entrypoint sh --workdir /opt/app $(IMAGE_NAME)
.PHONY: shell

tag:
	-git tag -d $(CODECLIMATE_TEST_REPORTER_VERSION)
	-git push origin :refs/tags/$(CODECLIMATE_TEST_REPORTER_VERSION)
	git tag $(CODECLIMATE_TEST_REPORTER_VERSION)
	git push origin $(CODECLIMATE_TEST_REPORTER_VERSION)
.PHONY: tag