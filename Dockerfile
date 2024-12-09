FROM quay.io/jupyter/datascience-notebook:latest

WORKDIR /home/jovyan/work

# Switch to root user to install dependencies
USER root

# Add necessary repositories for PDAL
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntugis/ubuntugis-unstable && \
    apt-get update

# Install system dependencies
RUN apt-get install -y \
    git \
    pdal \
    libpdal-dev \
    cmake \
    g++ \
    gcc \
    libpython3-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://github.com/pramonettivega/lidar_demo.git /home/jovyan/work/lidar_demo

# Install requirements.txt
RUN pip install --no-cache-dir -r /home/jovyan/work/lidar_demo/requirements.txt

# Set permissions for the working directory
RUN chown -R jovyan:users /home/jovyan/work

USER jovyan