.PHONY:

REPO := "capptions/proxy"
PKG_NAME=$(shell basename `pwd`)

docker:
	docker-compose -f proxy.yaml build proxy

docker_login:
	echo "$(DOCKER_PASSWORD)" | docker login -u "$(DOCKER_USERNAME)" --password-stdin

docker_upload: docker_login
	docker-compose -f proxy.yaml push proxy
	docker tag $(REPO):latest $(REPO):$(TRAVIS_BRANCH)-$(TRAVIS_BUILD_NUMBER)
	docker push $(REPO):$(TRAVIS_BRANCH)-$(TRAVIS_BUILD_NUMBER)
	docker tag $(REPO):latest $(REPO):$(TRAVIS_BRANCH)-latest
	docker push $(REPO):$(TRAVIS_BRANCH)-latest

