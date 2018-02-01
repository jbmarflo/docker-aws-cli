.DEFAULT_GOAL := build

build: ## build image, usage: make build, make build image=nginx
	./script.sh build

list_items_s3: ## List items from bucket s3
	./script.sh lists3

upload_file: ##Upload file to bucket s3
	./script.sh lists3