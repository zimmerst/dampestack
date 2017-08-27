FROM centos:6.6
MAINTAINER Stephan Zimmer <zimmer@slac.stanford.edu>
RUN yum -y install pip
### adding cvmfs
RUN mkdir -p /cvmfs/dampe.cern.ch
RUN yum -y install https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm
RUN yum -y yum install cvmfs cvmfs-config-default
ADD default.local /etc/cvmfs/default.local
RUN service autofs restart
### adding workflow
RUN curl -o /tmp/workflow.tar.gz -k -L https://dampevm3.unige.ch/dmpworkflow/releases/DmpWorkflow.devel.tar.gz && \
    pip install /tmp/workflow.tar.gz 
ENTRYPOINT ["/bin/bash","--login","-c"]