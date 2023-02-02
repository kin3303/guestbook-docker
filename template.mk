.PHONY: $(COMMON_TARGETS)

all: build push pull

allwithclean: cleanimages all

build:
	docker build -t kin3303/$(MODULE_NAME):$(TAG) .

push: build
	docker push kin3303/$(MODULE_NAME):$(TAG)

pull: 
	docker pull kin3303/$(MODULE_NAME):$(TAG)

clean: cleanimages

cleanimages:
	docker rmi kin3303/$(MODULE_NAME):$(TAG)
