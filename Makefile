USER ?= ahoereth

.SECONDEXPANSION:
image/%: Dockerfile.$$(subst -,.,%)
	docker build -t ${USER}/$* -f Dockerfile.$(subst -,.,$*) .

intel-tensorflow: intel-python image/intel-tensorflow

%: image/% ;

all: intel-python intel-tensorflow
