SALT_RELEASES := latest 2016.3 2015.8

TAG_PARTS ?= $(subst -, ,$@)
BUILD_FROM_TAG ?= $(firstword $(TAG_PARTS))
SALT_RELEASE ?= $(lastword $(TAG_PARTS))

# Since we're built from docker-ubuntu-salt-minion, this is fine.
BUILD_FROM_TAG ?= $(TAG)

BUILD_ARGS ?= --build-arg SALT_RELEASE=$(SALT_RELEASE)

TAGS ?= $(foreach TAG,$(UBUNTU_TAGS),$(addprefix $(TAG)-,$(SALT_RELEASES)))

EXTRA_TAGS += $(foreach TAG,$(UBUNTU_TAGS),$(TAG)=$(TAG)-latest) \
							$(foreach SALT_RELEASE,$(SALT_RELEASES),$(SALT_RELEASE)=latest-$(SALT_RELEASE))

include Makefile.docker

