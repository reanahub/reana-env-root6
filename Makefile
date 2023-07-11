IMAGE=docker.io/reanahub/reana-env-root6

all:
	@echo "Usage: make <action> where action is build, test, or push."

build: Dockerfile
	docker build -t $(IMAGE) .

test:
	docker run -i -t --rm $(IMAGE) root-config --version | grep -q ^6

lint:
	docker run --rm -i -v `pwd`/.hadolint.yaml:/root/.config/hadolint.yaml docker.io/hadolint/hadolint:v1.18.2 < Dockerfile

push:
	docker push $(IMAGE)
