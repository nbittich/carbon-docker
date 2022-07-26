FROM ubuntu:22.04
RUN apt update && apt upgrade -y
RUN apt install build-essential -y
RUN apt install curl -y
RUN apt install git -y
RUN apt install procps file wget -y
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt update && apt  install -y nodejs

RUN npm install -g @bazel/bazelisk

RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh

RUN apt install -y lsb-release software-properties-common
RUN ./llvm.sh all

RUN apt install clang -y
WORKDIR /opt/carbon

RUN git clone https://github.com/carbon-language/carbon-lang


RUN apt install libz-dev -y

WORKDIR /opt/carbon/carbon-lang

# https://github.com/carbon-language/carbon-lang/tree/trunk/installers/local
RUN bazel run -c opt //installers/local:install

ENTRYPOINT  ["/usr/bin/carbon-explorer"]