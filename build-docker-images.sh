#!/bin/bash

# build image
docker build -t kytk/docker-fsl:6.0.6.2 .

# make archive
#docker save -o docker-fsl.6.0.6.2.tar docker-fix:6.0.6.2
#pigz docker-fsl.6.0.6.2.tar

