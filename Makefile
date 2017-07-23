image/%:
	docker build -t ahoereth/tf-$* -f Dockerfile.tf.$* .

intel: image/base
	make image/intel

all: intel
