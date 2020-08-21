FROM jupyter/datascience-notebook

RUN python --version

RUN conda install --quiet --yes -c \
    conda-forge osmnx dask

COPY requirements.txt ./requirements.txt 
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt

COPY config.yaml /opt/config.yaml

ADD fonts /usr/share/fonts/truetype/

ADD scripts /opt/scripts/
#RUN chmod 777 /opt/scripts/ 

RUN  apt-get install default-jdk -Y
#RUN apt-get update
#RUN apt-get install oracle-java8-installer



RUN fc-cache
RUN fc-list

VOLUME /notebooks
WORKDIR /notebooks