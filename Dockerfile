FROM node:20-bookworm-slim

RUN corepack enable

WORKDIR /app/src
COPY ./ ./
RUN pnpm install
RUN pnpm --filter=./packages/app deploy /app/dist

ENTRYPOINT ["/app/src/docker-entrypoint"]
