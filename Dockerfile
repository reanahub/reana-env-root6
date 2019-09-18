# Environment: ROOT6 on Ubuntu/Trusty:
FROM ubuntu:bionic
RUN apt-get update
RUN apt-get install --yes g++ cpp gcc gfortran git dpkg-dev make binutils libxpm-dev libxft-dev libxext-dev \
                              libssl-dev libpcre3-dev xlibmesa-glu-dev libglew1.5-dev libftgl-dev libmysqlclient-dev \
                              libfftw3-dev graphviz-dev libavahi-compat-libdnssd-dev libldap2-dev python3-dev \
                              libxml2-dev libkrb5-dev libgsl0-dev libqt4-dev libx11-dev libxpm-dev libxext-dev \
                              cmake

# Install python3 extras
RUN apt-get install --yes build-essential libpq-dev openssl libffi-dev zlib1g-dev &&\
    apt-get install --yes python3-pip

ENV ROOTSYS /usr/local
RUN git clone --quiet http://root.cern.ch/git/root.git /ROOT/root-v6-18-04 &&\
    cd  /ROOT/root-v6-18-04 &&\
    git checkout v6-18-04 &&\
    cd ../ &&\
    mkdir build_dir &&\
    cd build_dir &&\
    cmake ../root-v6-18-04  &&\
    cmake --build . &&\
    cd ../ &&\
    rm -rf root-v6-18-04
