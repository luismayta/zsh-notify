FROM hadenlabs/python:3.8.0-slim

ARG stage

LABEL NAME zsh-notify-app-$stage

ENV USERNAME developer

ENV PACKAGES bash \
  openssl

ENV ZUNIT_VERSION "0.8.2"

COPY Pipfile* /usr/src/

# set working directory to /usr/src/
WORKDIR /usr/src/

# install packages
RUN apt-get update -y \
  && apt-get install -y ${PACKAGES} --no-install-recommends \

  # revolver
  && curl -L https://raw.githubusercontent.com/molovo/revolver/master/revolver > /usr/local/bin/revolver \
  && chmod +x /usr/local/bin/revolver \
  # zunit
  && curl -L https://github.com/zunit-zsh/zunit/releases/download/v${ZUNIT_VERSION}/zunit > /usr/local/bin/zunit \
  && chmod +x /usr/local/bin/zunit \

  # Permissions
  && groupadd -g 500 -r python \
  && groupadd ${USERNAME} \
  && useradd -m -g ${USERNAME} -G python ${USERNAME} \
  && chown -R ${USERNAME}:python /usr/local/bin \
  && su ${USERNAME} \
  && mkdir -p /usr/src \
  && chown -R ${USERNAME} /usr/src \


# pipenv
  && pip3 install --no-cache-dir pipenv \
  && pipenv install --dev --skip-lock \
  && pipenv shell --fancy \

# clean
  && apt-get clean \
  && apt-get autoremove \
  && apt-get purge \
  && rm -rf /var/lib/apt/lists/*
