FROM jupyter/base-notebook:c7d997f2db86
MAINTAINER Dan Lanier <lanier4@illinois.edu>

RUN conda update -n base conda

# conda/pip/apt install additional packages here, if desired.
RUN pip install --upgrade pip
RUN pip install redis
RUN pip install knpackage

RUN conda install -y numpy
RUN conda install -y scipy
RUN conda install -y scikit-learn
RUN conda install -y pandas
RUN conda install -y pyyaml
RUN conda install -y xmlrunner
RUN conda install -y cython
RUN conda install -y ipywidgets
RUN conda install -y matplotlib
RUN conda install -y lifelines
RUN conda install -y pymc

# pin jupyterhub to match the Hub version
# set via --build-arg in Makefile
ARG JUPYTERHUB_VERSION=0.9.*
RUN pip install --no-cache jupyterhub==$JUPYTERHUB_VERSION

USER jovyan

# docker build -t aka1spanky/knowengpipelines:base07_07_2018 .
# docker push aka1spanky/knowengpipelines:base07_07_2018