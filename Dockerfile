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
                    cmake \
                    unzip \
                    tar \
                    ca-certificates

# Install GDAL dependencies
# Install GDAL dependencies
RUN apt-get install -y libgdal-dev g++ --no-install-recommends && \
    apt-get clean -y
    
# Update C env vars so compiler can find gdal
ENV CPLUS_INCLUDE_PATH=/usr/include/gdal
ENV C_INCLUDE_PATH=/usr/include/gdal

RUN apt-get autoclean && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
