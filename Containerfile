FROM alpine:edge

LABEL com.github.containers.toolbox="true" \
      name="video-toolbox" \
      version="edge" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Alpine toolbox containers with video tools" \
      maintainer="Pedro Caetano <pedrompcaetano@gmail.com>"

# Install extra packages
COPY extra-packages /
RUN apk update && \
    apk upgrade && \
    cat /extra-packages | xargs apk add
RUN rm /extra-packages

# Mandatory to clear /media
RUN rm -fr /media
