# Use Ubuntu 24.04 as the base image
FROM ubuntu:24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=UTC

# Update package lists and install essential packages
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        software-properties-common \
        tzdata && \
        libncurses5-dev \
        libncursesw5-dev \
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    rm -rf /var/lib/apt/lists/*

# Add Kitware repository for latest CMake
RUN curl -fsSL https://apt.kitware.com/keys/kitware-archive-latest.asc | gpg --dearmor -o /usr/share/keyrings/kitware-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/kitware.list

# Install CMake, Ninja, build tools, and docs utilities
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        cmake \
        ninja-build \
        build-essential \
        git \
        doxygen \
        graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Verify installs
RUN cmake --version && ninja --version

# No WORKDIR to keep it flexible for external project mounting
