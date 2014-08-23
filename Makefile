IMAGE=grengojbo/go

all: build

build:
	docker build -t $IMAGE .

shell:
	docker run -it --rm $IMAGE /bin/bash

clean:
	docker rmi $IMAGE

push:
	@docker push $IMAGE

pull:
	@docker pull $IMAGE

.PHONY: all clean shell build push pull
