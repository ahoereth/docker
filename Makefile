image/%:
	docker build -t ahoereth/tf-$* -f Dockerfile.tf.$* .

intel: image/base image/intel

all: intel
