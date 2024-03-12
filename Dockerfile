# Use Red Hat Enterprise Linux latest image
FROM registry.access.redhat.com/ubi8/ubi:latest

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Install necessary tools and Python
RUN yum update -y && \
    yum install -y python3 python3-pip && \
    yum install -y yum-utils device-mapper-persistent-data lvm2 && \
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && \
    yum install -y docker-ce docker-ce-cli containerd.io && \
    yum clean all

# Install Rancher (Note: Rancher is typically not installed within a container. This step is for demonstration purposes only.)
RUN curl https://github.com/rancher/rancher/releases/download/v2.5.9/rancher-2.5.9-linux-amd64.tar.gz -L -o rancher.tar.gz && \
    tar xzf rancher.tar.gz && \
    mv rancher-2.5.9/* /usr/local/bin/ && \
    rm -rf rancher-2.5.9 rancher.tar.gz

# Set the default command for the container
CMD ["bash"]
