REPOSITORY ?= ahoereth/tensorflow
IMAGES = intel-python intel-tensorflow latest

.default: ${IMAGES}

intel-tensorflow: intel-python

latest: intel-tensorflow
	docker tag ${REPOSITORY}:intel-tensorflow ${REPOSITORY}:latest

.SECONDEXPANSION:
%: Dockerfile.$$(subst -,.,%)
	docker build . \
		-t ${REPOSITORY}:$* \
		-f Dockerfile.$(subst -,.,$*)

push/%: %
	docker push ${REPOSITORY}:$*

push: $(addprefix push/,${IMAGES})
