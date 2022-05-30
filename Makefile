
IMAGE?=oauth2-proxy
REGISTRY?=ghcr.io/containerinfra
VERSION	?=local

docker:
	DOCKER_BUILDKIT=1 docker build -t ${REGISTRY}/${IMAGE}:${VERSION} .

publish-docker:
	docker push ${REGISTRY}/${IMAGE}:${VERSION}
