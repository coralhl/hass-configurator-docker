FROM python:3.11-alpine
LABEL maintainer="coral"

WORKDIR /app

ARG HC_BUILD_VERSION=0.5.2

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash git openssh && \
    pip install --no-cache-dir hass-configurator==${HC_BUILD_VERSION} gitpython pyotp

COPY ./run.sh /app/
RUN chmod a+x ./run.sh

EXPOSE 3218
VOLUME /config
ENTRYPOINT ["/app/run.sh"]
