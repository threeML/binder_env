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
USER ${NB_UID}


RUN source activate env && jt -t onedork -f firacode -T -N -kl -cellw 90%  -cursc g


# Clear entrypoint
ENTRYPOINT []

# Set permissions
USER ${NB_UID}

