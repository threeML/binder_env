FROM threeml/base:1.0.0
MAINTAINER Michael Burgess <jburgess@mpe.mpg.de>

# As user
USER ${NB_UID}


RUN source activate env && jt -t onedork -f firacode -T -N -kl -cellw 90%  -cursc g


# Clear entrypoint
ENTRYPOINT []

# Set permissions
USER root
RUN chmod -R 777 .
RUN chown -R ${NB_UID}:${NB_GID} .
USER ${NB_UID}

# run from the home directory
WORKDIR ${HOME}
