FROM threeml/base
MAINTAINER Michael Burgess <jburgess@mpe.mpg.de>

# As user
USER ${NB_UID}


RUN jt -t onedork -f firacode -T -N -kl -cellw 90%  -cursc g


# Clear entrypoint
ENTRYPOINT []

COPY *_data ${HOME}
COPY *.ipynb ${HOME}
