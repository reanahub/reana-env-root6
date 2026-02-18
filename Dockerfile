# Use Ubuntu/24.04 base image
FROM docker.io/library/ubuntu:24.04

# Install ROOT6 prerequisites
# hadolint ignore=DL3008
RUN apt-get update -y && \
    apt-get install --no-install-recommends -y \
        binutils \
        build-essential \
        ca-certificates \
        cmake \
        cpp \
        dpkg-dev \
        g++ \
        gcc \
        gfortran \
        git \
        graphviz-dev \
        libavahi-compat-libdnssd-dev \
        libffi-dev \
        libfftw3-dev \
        libftgl-dev \
        libglew-dev \
        libgsl-dev \
        libkrb5-dev \
        libldap2-dev \
        libmysqlclient-dev \
        libpcre3-dev \
        libpq-dev \
        libssl-dev \
        libtbb-dev \
        libx11-dev \
        libxext-dev \
        libxft-dev \
        libxml2-dev \
        libxpm-dev \
        make \
        openssl \
        python3-dev \
        python3-numpy \
        libglu1-mesa-dev \
        zlib1g-dev && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get -y autoremove && \
    apt-get -y clean

# Compile ROOT6
ENV ROOTSYS=/usr/local
# hadolint ignore=DL3003
RUN git clone --quiet --depth 1 --branch v6-38-00 https://github.com/root-project/root.git /code/root && \
    cd /code && \
    mkdir _build && \
    cd _build && \
    cmake -DCMAKE_CXX_STANDARD=17 -Dbuiltin_xrootd=On ../root && \
    cmake --build . -- -j3 && \
    cmake -P cmake_install.cmake && \
    cd / && \
    rm -rf /code

# Set helpful environment variables to point to local ROOT installation
ENV CMAKE_PREFIX_PATH=/usr/local
ENV DYLD_LIBRARY_PATH=/usr/local/lib
ENV JUPYTER_PATH=/usr/local/etc/notebook
ENV LD_LIBRARY_PATH=/usr/local/lib
ENV LIBPATH=/usr/local/lib
ENV PYTHONPATH=/usr/local/lib
ENV SHLIB_PATH=/usr/local/lib
