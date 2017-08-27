FROM centos:6.6
MAINTAINER Stephan Zimmer <zimmer@slac.stanford.edu>
### adding cvmfs
RUN yum -y install https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest.noarch.rpm && yum clean all
RUN yum -y install cvmfs cvmfs-config-default --nogpgcheck && yum clean all
RUN cvmfs_config setup
ADD default.local /etc/cvmfs/default.local
RUN mkdir -p /cvmfs/dampe.cern.ch
### ROOT prerequisites
RUN yum -y install git cmake gcc-c++ gcc binutils libX11-devel libXpm-devel libXft-devel libXext-devel && yum clean all
### adding workflow
### RUN curl -o /tmp/workflow.tar.gz -k -L https://dampevm3.unige.ch/dmpworkflow/releases/DmpWorkflow.devel.tar.gz && \
###    pip install /tmp/workflow.tar.gz 
RUN echo "mount -t cvmfs dampe.cern.ch /cvmfs/dampe.cern.ch" >> /root/.bashrc
RUN echo "source /cvmfs/dampe.cern.ch/rhel6-64/etc/setup.sh" >> /root/.bashrc
ENTRYPOINT ["/bin/bash","--login","-c"]