MAKEFLAGS += --warn-undefined-variables
REGISTRY ?=
IMAGE ?= $(REGISTRY)trevorj/ubuntu-salt-minion
TAG ?= latest

.PHONY: %

all: build

build:
	docker build -t $(IMAGE):$(TAG) .

tag-%:
	docker TAG -f $(IMAGE):$(TAG) $(IMAGE):$*

push-%: tag-%
	docker push $(IMAGE):$*

tag: tag-latest
push: push-latest
