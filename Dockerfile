FROM ubuntu:focal

LABEL maintainer="Arnaud Becheler" \
      description="Basic C++ stuff for CircleCi repo." \
      version="0.1.0"
      
ARG DEBIAN_FRONTEND=noninteractive
     
ENV TZ=Europe/Berlin
RUN apt-get update -y
RUN apt-get install -y --no-install-recommends\
                    git \
                    gcc-9 \
                    g++ \
                    build-essential \
                    libboost-all-dev \
                    binutils libproj-dev gdal-bin \
                    cmake \
                    unzip \
                    tar \
                    ca-certificates
                    
RUN apt-get autoclean && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
