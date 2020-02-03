FROM registry.access.redhat.com/ubi8/ubi:latest

MAINTAINER abo@kth.se

USER root
RUN yum -y update && yum -y install git-core python36 && yum -y clean all
RUN alternatives --set python /usr/bin/python3

RUN mkdir /app
RUN useradd cipherscan
RUN chown cipherscan:cipherscan /app

USER cipherscan
WORKDIR /app
RUN git clone https://github.com/mozilla/cipherscan
WORKDIR /app/cipherscan
# To download additional software.
RUN ./cscan.sh --help
ENTRYPOINT ["/app/cipherscan/cipherscan"]
