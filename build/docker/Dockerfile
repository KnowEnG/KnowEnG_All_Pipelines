FROM jupyter/base-notebook:c7d997f2db86
MAINTAINER Dan Lanier <lanier4@illinois.edu>
# /KnowEnG_All_Pipelines/build/docker/     base image Dockerfile

USER root
ENV NB_USER jovyan

RUN apt-get update
RUN apt-get install -y git

RUN mkdir /pipelines
# Clone from github
ENV SC_SRC_LOC /pipelines/Samples_Clustering_Pipeline
RUN git clone https://github.com/KnowEnG/Samples_Clustering_Pipeline.git ${SC_SRC_LOC}

ENV GC_SRC_LOC /pipelines/General_Clustering_Pipeline
RUN git clone https://github.com/KnowEnG/General_Clustering_Pipeline.git ${GC_SRC_LOC}

ENV FP_SRC_LOC /pipelines/Feature_Prioritization_Pipeline
RUN git clone https://github.com/KnowEnG/Feature_Prioritization_Pipeline.git ${FP_SRC_LOC}

ENV GSC_SRC_LOC /pipelines/GeneSet_Characterization_Pipeline
RUN git clone https://github.com/KnowEnG/GeneSet_Characterization_Pipeline.git ${GSC_SRC_LOC}

ENV SA_SRC_LOC /pipelines/Signature_Analysis_Pipeline
RUN git clone https://github.com/KnowEnG/Signature_Analysis_Pipeline.git ${SA_SRC_LOC}

USER ${NB_USER}

RUN conda update -n base conda
RUN conda clean --all
RUN conda install -y matplotlib
RUN conda clean --all
RUN conda install -y lifelines
RUN conda clean --all
RUN conda install -y pymc
RUN conda clean --all
RUN conda install -y pyyaml
RUN conda clean --all
RUN conda install -y xmlrunner
RUN conda clean --all
RUN conda install -y cython
RUN conda clean --all
RUN conda install -y ipywidgets
RUN conda clean --all

RUN conda install -y numpy==1.11.1
RUN conda clean --all
RUN conda install -y pandas==0.18.1
RUN conda clean --all
RUN conda install -y scipy==0.19.1
RUN conda clean --all
RUN conda install -y scikit-learn==0.17.1
RUN conda clean --all

RUN pip install --upgrade pip

ARG JUPYTERHUB_VERSION=0.9.*
RUN pip install --no-cache jupyterhub==$JUPYTERHUB_VERSION
RUN pip install redis
RUN pip install knpackage

# docker build -t knowengdev/jupyter_notebooks:base .
