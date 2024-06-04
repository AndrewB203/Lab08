FROM ubuntu:18.04

RUN apt update
RUN apt install -yy gcc g++ cmake

COPY . print/
WORKDIR print

RUN cmake -H. -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install -DBUILD_EXAMPLES=ON
RUN cmake --build build
RUN cmake --build build --target install

ENV LOG_PATH /home/logs/log.txt

VOLUME /home/logs

WORKDIR _install/bin

ENTRYPOINT ./example1
