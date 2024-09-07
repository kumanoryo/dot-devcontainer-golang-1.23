DOCKERHUB_REPONAME=ghcr.io/bearfield
CONTAINER_NAME=golang
TAG_NAME=test.1.23

MAKEFILE_DIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
WORK_DIR=$(MAKEFILE_DIR)

.PHONY:pull.base
pull.base:
	docker pull ghcr.io/bearfield/debian-fish:bookworm

.PHONY:test.build
test.build: pull.base
	cd $(WORK_DIR)
	docker build --tag=$(DOCKERHUB_REPONAME)/$(CONTAINER_NAME):$(TAG_NAME) ./docker

.PHONY:test.rmi
test.rmi:
	docker rmi $(DOCKERHUB_REPONAME)/$(CONTAINER_NAME):$(TAG_NAME)

.PHONY:test
test: test.build test.rmi
