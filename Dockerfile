FROM rootproject/root:6.24.06-centos7

USER root
RUN yum update -y && \
    yum install -y \
        binutils \
        build-essential \
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
        libglew1.5-dev \
        libgsl0-dev \
        libkrb5-dev \
        libldap2-dev \
        libmysqlclient-dev \
        libpcre3-dev \
        libpq-dev \
        libqt4-dev \
        libssl-dev \
        libx11-dev \
        libxext-dev \
        libxext-dev \
        libxft-dev \
        libxml2-dev \
        libxpm-dev \
        libxpm-dev \
        make \
        openssl \
        python-dev \
        python-pip \
        xlibmesa-glu-dev \
        zlib1g-dev && \
    yum clean all && \
    rm -rf /var/cache/yum

USER user
WORKDIR /home/user
