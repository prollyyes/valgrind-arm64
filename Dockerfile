FROM ubuntu as buildenv

RUN mkdir -p /workspace
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y wget build-essential git cmake curl nano valgrind gdb

WORKDIR /workspace

RUN rm -rf /var/lib/apt/lists/*
CMD ["/bin/bash"]




