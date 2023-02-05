## Dockerfile to make "docker-fsl"
## This file makes a container image of FSL
## FSL 6.0.6.2
## K. Nemoto 05 Feb 2023

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

## General
# Change default sh from Dash to Bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install utilities, python, and R
# libgl1-mesa-dev is needed for fslpython
RUN apt-get update && apt-get install -y --no-install-recommends \
  bc less libgl1-mesa-dev nano sudo vim wget python

## FSL
# Install FSL, get rid of src directory, and set environment variables
RUN cd /tmp && wget http://www.lin4neuro.net/lin4neuro/neuroimaging_software_packages/fsl-6.0.6.2.tar.gz && \
  cd /usr/local && tar xvzf /tmp/fsl-6.0.6.2.tar.gz && \
  rm -rf /usr/local/fsl/src && \
  rm /tmp/fsl-6.0.6.2.tar.gz

ENV FSLDIR=/usr/local/fsl
ENV PATH=${FSLDIR}/share/fsl/bin:${PATH}
ENV FSLOUTPUTTYPE=NIFTI_GZ
ENV FSLTCLSH=$FSLDIR/bin/fsltclsh
ENV FSLWISH=$FSLDIR/bin/fslwish

## USER is needed for feat
# User brain
ARG UID=1000
RUN useradd -m -u ${UID} brain && echo "brain:lin4neuro" | chpasswd && adduser brain sudo
USER brain
ENV USER=brain

