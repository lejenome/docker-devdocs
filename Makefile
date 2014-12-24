all: clean build

clean:
	docker images | grep lejenome/devdocs:latest && docker rmi  -f lejenome/devdocs:latest || echo -n

build:
	docker build -t lejenome/devdocs .

run:
	docker run lejenome/devdocs:latest

