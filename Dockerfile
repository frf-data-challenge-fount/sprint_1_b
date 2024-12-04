FROM ghcr.io/dask/dask-notebook:latest

WORKDIR /home/jovyan/work

USER root

RUN apt-get update && apt-get install -y \
    git

RUN git clone https://github.com/pramonettivega/lidar_demo.git

RUN pip install -r /home/jovyan/work/lidar_demo/requirements.txt

RUN chown -R jovyan:users /home/jovyan/work

USER jovyan