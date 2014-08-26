# Golang base host
#
# VERSION               0.1.4

FROM     grengojbo/base:latest
MAINTAINER Oleg Dolya "oleg.dolya@gmail.com"

# Install software
RUN apt-get update && apt-get install --no-install-recommends -yq \
        autoconf \
        build-essential \
        procps \
        bzr \
        cvs \
        git \
        mercurial \
        subversion && apt-get -y autoremove && apt-get -y autoclean && apt-get -y clean

# prepare go environment
ENV GOROOT /usr/local/go
RUN mkdir -p $GOROOT
ENV GOPATH /go
RUN mkdir -p $GOPATH
RUN mkdir -p $GOPATH/src
ENV PATH $GOROOT/bin:$GOPATH/bin:$PATH

# install go
RUN curl -sk https://storage.googleapis.com/golang/go1.3.src.tar.gz | tar -C $GOROOT -xzf - --strip-components 1 \
  && /usr/local/go/src && ./make.bash --no-clean 2>&1

WORKDIR $GOPATH/src
RUN go get github.com/kr/godep
ENV PORT 8080
RUN mkdir -p /app/bin
#ENV HOME /app
#RUN echo 'export GOPATH=/go' >> /app/.bash_profile
#RUN echo 'export PATH=$PATH:$GOPATH/bin'  >> $HOME/.bash_profile