FROM knowengdev/jupyter_notebooks:base07_17_2018
MAINTAINER Dan Lanier <lanier4@illinois.edu>

# KnowEnG_All_Pipelines docker image with notebooks directory

USER root
RUN conda update -n base conda
ENV NB_USER jovyan

ENV ST_SRC_LOC /pipelines/Spreadsheets_Transformation_Pipeline
RUN git clone https://github.com/KnowEnG-Research/Spreadsheets_Transformation.git ${ST_SRC_LOC}

RUN gzip -d /pipelines/Samples_Clustering_Pipeline/data/spreadsheets/*.gz

RUN gzip -d /pipelines/General_Clustering_Pipeline/data/spreadsheets/*.gz

RUN gzip -d /pipelines/GeneSet_Characterization_Pipeline/data/spreadsheets/*.gz
RUN gzip -d /pipelines/GeneSet_Characterization_Pipeline/data/networks/*.gz


ENV HOME /home/${NB_USER}
COPY data/server_notebooks ${HOME}/notebooks
RUN chown -R jovyan /home/jovyan
RUN chgrp -R users /home/jovyan

USER ${NB_USER}

RUN conda install -y lifelines==0.11.2
RUN conda install -y matplotlib==2.2.2

# docker build -t knowengdev/jupyter_notebooks:all_pipelines .

