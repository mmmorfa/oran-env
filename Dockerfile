
FROM cruizba/ubuntu-dind:focal-latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y ca-certificates gpg wget && \
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null && \
    echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null && \
    apt-get update && \
    rm /usr/share/keyrings/kitware-archive-keyring.gpg && \
    apt-get install -y kitware-archive-keyring && \
    apt-get install -y cmake && \
    apt install -y git && \
    git clone https://github.com/swig/swig.git && \
    git clone https://gitlab.eurecom.fr/oai/openairinterface5g oai && \
    git clone https://github.com/GPurti/Flexric-TFG.git flexric

WORKDIR /swig
RUN apt-get install -y autoconf && \
    ./autogen.sh && \
    apt-get install -y libpcre2-dev && \
    ./configure --prefix=/usr/ && \
    apt-get install -y bison && \
    apt-get install -y g++ && \
    make -j8 && \
    make install && \
    apt install -y libsctp-dev python3.8 cmake-curses-gui libpcre2-dev python3-dev && \
    apt-get install -y apt-utils

WORKDIR /oai
RUN git checkout v2.1.0 

WORKDIR /oai/cmake_targets
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y libuhd-dev uhd-host && \
    ./build_oai -I -w SIMU && \
    ./build_oai -I -w SIMU --gNB --nrUE --build-e2

WORKDIR /flexric
RUN git checkout sm && \
    mkdir build

WORKDIR /flexric/build
RUN cmake .. && \
    make -j8 && \
    make install

RUN rm -rf /swig && \
    rm -rf /oai && \
    rm -rf /flexric

WORKDIR /home