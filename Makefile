# Variables
CONTAINER_NAME = my-mongodb
IMAGE_NAME = my-mongodb-image
CONFIG_FILE = mongod.conf

# Docker commands
install:
	@docker pull mongo

build: create-config
	@docker build -t $(IMAGE_NAME) .


start-server:
	go run server.go

start:
	@docker run --name $(CONTAINER_NAME) -d -p 27017:27017 $(IMAGE_NAME)

stop:
	@docker stop $(CONTAINER_NAME)

teardown:
	@docker stop $(CONTAINER_NAME)
	@docker rm $(CONTAINER_NAME)

create-config:
	@if [ ! -f $(CONFIG_FILE) ]; then \
		echo "Creating $(CONFIG_FILE)"; \
		echo "# MongoDB Configuration File" > $(CONFIG_FILE); \
		echo "storage:" >> $(CONFIG_FILE); \
		echo "  dbPath: /data/db" >> $(CONFIG_FILE); \
		echo "  journal:" >> $(CONFIG_FILE); \
		echo "    enabled: true" >> $(CONFIG_FILE); \
		echo "systemLog:" >> $(CONFIG_FILE); \
		echo "  destination: file" >> $(CONFIG_FILE); \
		echo "  path: /var/log/mongodb/mongod.log" >> $(CONFIG_FILE); \
	fi

.PHONY: install build start stop teardown create-config
