.PHONY: $(COMMON_TARGETS)

all: build push pull

build:
	docker build -t $(REG)/$(MODULE_NAME):$(TAG) .

push: build
	docker push $(REG)/$(MODULE_NAME):$(TAG)

pull: 
	docker pull $(REG)/$(MODULE_NAME):$(TAG)

clean: cleanimages

cleanimages:
	docker rmi $(REG)/$(MODULE_NAME):$(TAG)
