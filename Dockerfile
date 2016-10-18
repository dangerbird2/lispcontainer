# ~*~Dockerfile~*~
# Steve Shea

FROM debian
MAINTAINER Steven L. Shea

RUN apt-get update && \
    apt-get install -y \
    cl-quicklisp \
    sbcl 
ENV lisp_basedir /lispbase

RUN mkdir ${lisp_basedir}
WORKDIR ${lisp_basedir}

RUN sbcl --load /usr/share/cl-quicklisp/quicklisp.lisp \
    --eval '(quicklisp-quickstart:install)'
ADD . ${lisp_basedir}
VOLUME ${lisp_basedir}
RUN ln -s ${lisp_basedir}/init.lisp ~/.sbclrc
