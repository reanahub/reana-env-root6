IMAGE=docker.io/reanahub/reana-env-root6:6.38.00

all:
	@echo "Usage: make <action> where action is build, test, or push."

build: Dockerfile
	docker buildx build --platform linux/amd64,linux/arm64 -t $(IMAGE) .

test:
	docker run -i -t --rm $(IMAGE) root-config --version | grep -q ^6

lint:
	docker run --rm -i docker.io/hadolint/hadolint:v2.12.0 < Dockerfile

push:
	docker buildx build --platform linux/amd64,linux/arm64 -t $(IMAGE) --push .
