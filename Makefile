REPOSITORY ?= ahoereth/tensorflow

.default: intel-python intel-tensorflow

intel-tensorflow: intel-python

.SECONDEXPANSION:
%: Dockerfile.$$(subst -,.,%)
	docker build . \
		-t ${REPOSITORY}:$* \
		-f Dockerfile.$(subst -,.,$*) \
		--build-arg REPOSITORY=${REPOSITORY}


