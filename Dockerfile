FROM rootproject/root:6.24.06-centos7

USER root
RUN yum install -y epel-release
RUN yum update -y && \
    yum install -y \
        binutils \
        build-essential \
        cmake \
        cmake3 \
        cpp \
        dpkg-dev \
        g++ \
        gcc \
        gfal2-all \
        gfal2-util \
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
        python3-gfal2 \
        python3 \
        python3-pip \
        xlibmesa-glu-dev \
        zlib1g-dev && \
    yum clean all && \
    rm -rf /var/cache/yum

# gfal2-python bindings
RUN curl -o /etc/yum.repos.d/gfal2-repo.repo https://dmc-repo.web.cern.ch/dmc-repo/dmc-el7.repo && \
    git clone --branch v1.12.0 https://github.com/cern-fts/gfal2-python.git && \
    cd gfal2-python/ && \
    ./ci/fedora-packages.sh && \
    cd packaging/ && \
    RPMBUILD_SRC_EXTRA_FLAGS="--without docs --without python2" make srpm && \
    yum-builddep -y python3-gfal2 && \
    pip install gfal2-python && \
    yum clean all && \
    cd / && \
    rm -rf gfal2-python && \
    rm -rf /var/cache/yum

RUN pip3 install rucio-clients==1.29.1

# EGI trust anchors
RUN curl -Lo /etc/yum.repos.d/EGI-trustanchors.repo https://repository.egi.eu/sw/production/cas/1/current/repo-files/EGI-trustanchors.repo && \
    yum -y install ca-certificates ca-policy-egi-core && \
    yum clean all && \
    rm -rf /var/cache/yum

USER user
WORKDIR /home/user
