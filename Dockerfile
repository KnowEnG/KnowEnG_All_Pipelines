FROM knowengdev/jupyter_notebooks:base07_13_2018
MAINTAINER Dan Lanier <lanier4@illinois.edu>

# KnowEnG_All_Pipelines docker image with notebooks directory

USER root
ENV NB_USER jovyan

RUN conda update -n base conda
RUN conda clean --all

ENV HOME /home/${NB_USER}
COPY data/server_notebooks ${HOME}/notebooks
RUN chown -R jovyan /home/jovyan
RUN chgrp -R users /home/jovyan

USER ${NB_USER}

# docker build -t knowengdev/jupyter_notebooks:test_notebooks .

