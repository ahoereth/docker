REPOSITORY ?= ahoereth/tensorflow
IMAGES = intel-gpu intel latest
TF_VERSION ?= master

.default: ${IMAGES}

latest: intel
	docker tag ${REPOSITORY}:$< ${REPOSITORY}:$@

.SECONDEXPANSION:
%: Dockerfile.$$(subst -,.,%)
	docker build . \
		--build-arg TF_VERSION=${TF_VERSION} \
		-t ${REPOSITORY}:$(subst master,latest,${TF_VERSION})-$* \
		-f Dockerfile.$(subst -,.,$*)

push/%: %
	docker push ${REPOSITORY}:$(subst master,latest,${TF_VERSION})-$*

push: $(addprefix push/,${IMAGES})
