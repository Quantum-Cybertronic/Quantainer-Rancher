# Use the official CentOS 7 image as the base image
FROM ubi:latest
LABEL maintainer="Quantum Cybertronics"
# Update the package index and install necessary packages
RUN yum -y update && yum -y install \
  curl \
  wget \
  vim \
  tar \
  gzip \
  unzip \
  which

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Make the app executable
RUN chmod +x /app

# Set the default command to execute when the container starts
CMD ["/app"]
