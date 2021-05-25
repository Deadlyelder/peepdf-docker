FROM debian:10-slim

LABEL MAINTAINER=sghatpande.eu

RUN apt-get update && apt-get install -y \
	python2.7 \
	libboost-all-dev \
	libemu-dev \
	python-pil \
	unzip \
	wget \
	libemu2 \
	autoconf \
	python-pip \
	git \
	pkg-config \
	unzip \
	&& apt-get autoclean \ 
	&& pip install pylibemu \
	&& adduser --shell /sbin/nologin --disabled-login --gecos "" appuser \
	&& git clone https://github.com/jesparza/peepdf.git \
	&& wget https://github.com/emmetio/pyv8-binaries/raw/master/pyv8-linux64.zip \
	&& unzip pyv8-linux64.zip \
	&& cp -a PyV8.py _PyV8.so /usr/lib/python2.7/dist-packages \
	&& cp -a PyV8.py _PyV8.so /usr/bin \
 	&& chown -R appuser:appuser /peepdf

WORKDIR /peepdf
RUN git checkout c74dc65c0ac7e506bae4f2582a2435ec50741f40

WORKDIR /home/appuser

USER appuser

ENTRYPOINT ["/usr/bin/python","/peepdf/peepdf.py"]
