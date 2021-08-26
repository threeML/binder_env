FROM threeml/base:1.0.0
MAINTAINER Michael Burgess <jburgess@mpe.mpg.de>


ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}



RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}

# As user
USER root

COPY . ${HOME}

RUN chown -R ${USER} ${HOME}


RUN source activate env && jt -t onedork -f firacode -T -N -kl -cellw 90%  -cursc g &&\
    echo "source activate env" > ~/.bashrc

RUN mkdir -p ${HOME}.config/astromodels  &&\
    mkdir -p ${HOME}.config/threeml  &&\
    mkdir -p ${HOME}.astromodels/data  &&\
    mkdir -p ${HOME}.astromodels/log  &&\
    mkdir -p ${HOME}.threeml/log  &&\
    chmod -R 777 ${HOME} && chown -R ${USER} ${HOME}

USER ${USER}

RUN source activate env && python -c "from astromodels.xspec import *"


# RUN chown -R ${NB_USER} ${HOME}/.config
# RUN chown -R ${NB_USER} ${HOME}/.threeml
# RUN chown -R ${NB_USER} ${HOME}/.astromodels

# Clear entrypoint
ENTRYPOINT []

#RUN jupyter serverextension enable --py nbgitpuller --sys-prefix
