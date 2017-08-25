FROM centos:6.6
MAINTAINER Stephan Zimmer <zimmer@slac.stanford.edu>
RUN yum -y install pip
ENTRYPOINT ["/bin/bash","--login","-c"]