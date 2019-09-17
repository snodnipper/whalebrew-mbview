FROM node:10
RUN apt-get update \
    && apt-get install git \
    && git clone https://github.com/mapbox/mbview.git \
    && cd mbview \
    && npm audit fix \
    && npm install \
    && npm install -g

LABEL io.whalebrew.name mbview
LABEL io.whalebrew.config.environment '["MAPBOX_ACCESS_TOKEN"]'
LABEL io.whalebrew.config.ports '["3000:3000"]'

ENTRYPOINT ["/usr/local/bin/mbview"]

