FROM ubuntu:16.04
MAINTAINER Alexander Höreth <alexander@psiori.com>


### Dependencies
RUN apt-get update -qqq --fix-missing \
 && apt-get install -y -qqq --no-install-recommends \
        apt-transport-https \
        wget \
        bzip2 \
        ca-certificates \
        libglib2.0-0 \
        libxext6 \
        libsm6 \
        libxrender1 \
        curl \
        wget \
        git \
        g++ \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*


### Conda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
 && wget --quiet https://repo.continuum.io/miniconda/Miniconda3-4.3.14-Linux-x86_64.sh -O ~/miniconda.sh \
 && /bin/bash ~/miniconda.sh -b -p /opt/conda \
 && rm ~/miniconda.sh
ENV PATH /opt/conda/bin:$PATH


### Intelpython
# Already includes stuff like jupyter, numpy etc.
ENV ACCEPT_INTEL_PYTHON_EULA=yes
RUN conda update -y -q conda \
 && conda config --add channels intel \
 && conda install -y -q intelpython3_full python=3


### Jupyter Configuration
# https://github.com/ipython/ipython/issues/7062
COPY assets/jupyter_notebook_config.py /root/.jupyter/
COPY assets/run_jupyter.sh /
EXPOSE 8888
