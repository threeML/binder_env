FROM threeml/base:1.0.0
MAINTAINER Michael Burgess <jburgess@mpe.mpg.de>


ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}

# As user
USER root
RUN chown -R ${NB_USER} ${HOME}


RUN source activate env && jt -t onedork -f firacode -T -N -kl -cellw 90%  -cursc g


# Clear entrypoint
ENTRYPOINT []


USER ${USER}

RUN jupyter serverextension enable --py nbgitpuller --sys-prefix
