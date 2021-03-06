RELEASE_DIR := ./image/releases
PC_SERVER_BUNDLE_URL := https://terraria.org/system/dedicated_servers/archives/000/000/045/original/terraria-server-1422.zip?1619038474
TSHOCK_RELEASE_URL := https://github.com/Pryaxis/TShock/releases/download/v4.5.2/TShock.4.5.2.Terraria.1.4.2.2a.zip
MOBILE_SERVER_BUNDLE_URL := https://terraria.org/server/MobileTerrariaServer.zip

IMAGE_TAG := v0.1.0
IMAGE_REPO := exklamationmark/terraria
IMAGE := ${IMAGE_REPO}:${IMAGE_TAG}
DOCKERFILE := ./image/Dockerfile
DOCKER_CONTEXT := ./image

CURL := curl
DOCKER := docker

clean:
	@rm -rf ${RELEASE_DIR}
.PHONY: clean

all:
.PHONY: all

${RELEASE_DIR}:
	@mkdir -p ${RELEASE_DIR}

${RELEASE_DIR}/pc.zip: ${RELEASE_DIR}
	$(CURL) -sL -o ${RELEASE_DIR}/pc.zip ${PC_SERVER_BUNDLE_URL}

${RELEASE_DIR}/mobile.zip: ${RELEASE_DIR}
	$(CURL) -sL -o ${RELEASE_DIR}/mobile.zip ${MOBILE_SERVER_BUNDLE_URL}

${RELEASE_DIR}/tshock.zip: ${RELEASE_DIR}
	$(CURL) -sL -o ${RELEASE_DIR}/tshock.zip ${TSHOCK_RELEASE_URL}

download-releases: ${RELEASE_DIR}/pc.zip ${RELEASE_DIR}/mobile.zip
.PHONY: download-releases

image: ${DOCKERFILE}
image:
	$(DOCKER) build -t ${IMAGE} -f ${DOCKERFILE} ${DOCKER_CONTEXT}
	$(DOCKER) build -t ${IMAGE} -f ${DOCKERFILE} ${DOCKER_CONTEXT}
.PHONY: image
