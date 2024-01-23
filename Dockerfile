FROM node:18

RUN mkdir -p /app
WORKDIR /app
COPY . /app/

RUN rm yarn.lock || true
RUN rm package-lock.json || true
RUN --mount=type=secret,id=nest_env \
  mkdir -p /app/src/config/env && touch /app/src/config/env/.production.env \
  cat /run/secrets/nest_env >> /app/src/config/env/.production.env
RUN yarn
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD ["yarn", "start"]