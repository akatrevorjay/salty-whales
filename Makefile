SALTY_RELEASES := latest 2018.3 2017.7 2016.11

TAG_PARTS ?= $(subst -, ,$@)
BUILD_FROM_TAG ?= $(firstword $(TAG_PARTS))
SALTY_RELEASE ?= $(lastword $(TAG_PARTS))

# Since we're built from docker-ubuntu-salt-minion, this is fine.
BUILD_FROM_TAG ?= $(TAG)

BUILD_ARGS ?= --build-arg SALTY_RELEASE=$(SALTY_RELEASE) \
			  --build-arg SALTY_PARENT_TAG=$(BUILD_FROM_TAG)

TAGS ?= $(foreach TAG,$(UBUNTU_TAGS),$(addprefix $(TAG)-,$(SALTY_RELEASES)))

EXTRA_TAGS += $(foreach TAG,$(UBUNTU_TAGS),$(TAG)=$(TAG)-latest) \
							$(foreach SALTY_RELEASE,$(SALTY_RELEASES),$(SALTY_RELEASE)=latest-$(SALTY_RELEASE))

include Makefile.docker

