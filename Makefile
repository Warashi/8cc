DOCKER_RUN = docker exec compilerbook

.PHONY: none
none:
	echo none

.PHONY: build-docker
build-docker:
	docker build -t compilerbook .

.PHONY: daemon
daemon:
	docker run --name compilerbook -d --rm compilerbook sh -c 'trap : TERM INT; sleep infinity & wait'

.PHONY: stop-daemon
stop-daemon:
	docker stop compilerbook

.PHONY: debug-container
debug-container:
	docker exec -it compilerbook bash

.PHONY: test
test:
	$(eval TMP := $(shell docker exec compilerbook mktemp -d))
	tar -cO $(shell git ls-files) | docker cp - compilerbook:$(TMP)/
	docker exec -w $(TMP) compilerbook cmake .
	docker exec -w $(TMP) compilerbook make
	docker exec -w $(TMP) compilerbook ctest
	docker exec compilerbook rm -rf $(TMP)
