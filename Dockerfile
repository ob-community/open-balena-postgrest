FROM postgrest/postgrest:latest AS postgrest

FROM node:23-bookworm-slim

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    libpq5 \
    nodejs \
    node-typescript \
    jq \
    && rm -rf /var/lib/apt/lists/*

COPY --from=postgrest /bin/postgrest /bin/postgrest

WORKDIR /usr/src/app

COPY ./postgrest-proxy.js ./
COPY ./package.json ./
COPY ./package-lock.json ./

RUN npm ci --no-fund --no-update-notifier

COPY start.sh ./

ENV PGRST_DB_SCHEMA=public
ENV PGRST_DB_ANON_ROLE=anon
ENV PGRST_SERVER_HOST=127.0.0.1

CMD ["bash", "start.sh"]
