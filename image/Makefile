RELEASE_DIR := ./releases
PC_SERVER_BUNDLE_URL := https://terraria.org/system/dedicated_servers/archives/000/000/044/original/terraria-server-1421.zip?1617223487
MOBILE_SERVER_BUNDLE_URL := https://terraria.org/server/MobileTerrariaServer.zip

IMAGE_TAG := 0.0.1
IMAGE_REPO := exklamationmark/terraria
IMAGE := ${IMAGE_REPO}:${IMAGE_TAG}

CURL := curl
DOCKER := docker

clean:
	@rm -rf ${RELEASE_DIR}
.PHONY: clean

all:
.PHONY: all

image: Dockerfile
.PHONY: image

${RELEASE_DIR}:
	@mkdir -p ${RELEASE_DIR}

${RELEASE_DIR}/pc.zip: ${RELEASE_DIR}
	$(CURL) -sL -o ${RELEASE_DIR}/pc.zip ${PC_SERVER_BUNDLE_URL}

${RELEASE_DIR}/mobile.zip: ${RELEASE_DIR}
	$(CURL) -sL -o ${RELEASE_DIR}/mobile.zip ${MOBILE_SERVER_BUNDLE_URL}

download-releases: ${RELEASE_DIR}/pc.zip ${RELEASE_DIR}/mobile.zip
.PHONY: download-releases

image:
	$(DOCKER) build -t ${IMAGE} -f Dockerfile .
.PHONY: image
