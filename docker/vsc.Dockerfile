FROM python:3.12-bullseye

# env variable in container
ENV PATH="/root/miniconda3/bin:${PATH}"
# build arguments
ARG PATH="/root/miniconda3/bin:${PATH}"

RUN apt-get update

# install conda
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && mkdir /root/.conda \
    && bash Miniconda3-latest-Linux-x86_64.sh -b \
    && rm -f Miniconda3-latest-Linux-x86_64.sh 

RUN conda init