FROM jupyter/base-notebook:c7d997f2db86
MAINTAINER Dan Lanier <lanier4@illinois.edu>
# /KnowEnG_All_Pipelines/build/docker/     base image Dockerfile

USER root
ENV NB_USER jovyan

RUN apt-get update
RUN apt-get install -y git

RUN mkdir /pipelines
# Clone from github
ENV DC_SRC_LOC /pipelines/Data_Cleanup_Pipeline
RUN git clone https://github.com/KnowEnG-Research/Data_Cleanup_Pipeline.git ${DC_SRC_LOC}
ENV SC_SRC_LOC /pipelines/Samples_Clustering_Pipeline
RUN git clone https://github.com/KnowEnG/Samples_Clustering_Pipeline.git ${SC_SRC_LOC}
ENV ST_SRC_LOC /pipelines/Spreadsheets_Transformation
RUN git clone https://dlanier:runSallyrun396@github.com/KnowEnG/Spreadsheets_Transformation.git ${ST_SRC_LOC}

USER ${NB_USER}

RUN conda update -n base conda
RUN conda install -y matplotlib
RUN conda install -y lifelines
RUN conda install -y pymc
RUN conda install -y pyyaml
RUN conda install -y xmlrunner
RUN conda install -y cython
RUN conda install -y ipywidgets

RUN conda install -y numpy==1.11.1
RUN conda install -y pandas==0.18.1
RUN conda install -y scipy==0.19.1
RUN conda install -y scikit-learn==0.17.1

RUN conda clean --all

RUN pip install --upgrade pip

ARG JUPYTERHUB_VERSION=0.9.*
RUN pip install --no-cache jupyterhub==$JUPYTERHUB_VERSION
RUN pip install redis
RUN pip install knpackage

# docker build -t knowengdev/jupyter_notebooks:base .
