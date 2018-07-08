FROM aka1spanky/knowengpipelines:pipelines
MAINTAINER Dan Lanier <lanier4@illinois.edu>
# Built from... https://hub.docker.com/r/jupyter/base-notebook/
#               https://github.com/jupyter/docker-stacks/blob/master/base-notebook/Dockerfile
# Built from... Ubuntu 16.04

#ENV NB_USER jovyan
#ENV NB_UID 1000
#ENV HOME /home/${NB_USER}
#RUN adduser --disabled-password --gecos "Default user" --uid ${NB_UID} ${NB_USER}

USER root

# conda/pip/apt install additional packages here, if desired.

# pin jupyterhub to match the Hub version
# set via --build-arg in Makefile


ARG JUPYTERHUB_VERSION=0.9.*
RUN pip install --no-cache jupyterhub==$JUPYTERHUB_VERSION

RUN mkdir /home/jovyan/user_data
RUN chmod 666 /home/jovyan/user_data
#ENV USR_DATA_LOC /home/jovian/user_data
#COPY data/spreadsheets/* ${USR_DATA_LOC}/

RUN mkdir /home/jovyan/results
RUN chmod 666 /home/jovyan/results

ENV NB_LOC /home/jovyan
COPY Spreadsheets_Transformation.ipynb ${NB_LOC}

USER jovyan

# CMD ["jupyter", "notebook", "--ip", "0.0.0.0"]

# docker build --no-cache -t knowengdev/spreadsheets_transformation:$(CUR_DATE) .
