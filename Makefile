USER ?= ahoereth

.default: intel-python intel-tensorflow

intel-tensorflow: intel-python

%: ${USER}/% ;

.SECONDEXPANSION:
${USER}/%: Dockerfile.$$(subst -,.,%)
	docker build -t ${USER}/$* -f Dockerfile.$(subst -,.,$*) .


