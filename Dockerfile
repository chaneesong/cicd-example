FROM node:18

RUN mkdir -p /home/server
WORKDIR /home/server
COPY . /home/server/

RUN rm yarn.lock || true
RUN rm package-lock.json || true



RUN --mount=type=secret,id=nest_env \
  mkdir -p /home/server/src/config/env && touch /home/server/src/config/env/.production.env \
  cat /run/secrets/nest_env >> /home/server/src/config/env/.production.env

# RUN --mount=type=secret,id=nest_env
# COPY --chown=node:node /run/secrets/nest_env /tmp/nest_env
# RUN mkdir -p /app/src/config/env && touch /app/src/config/env/.production.env \
#   && cat /tmp/nest_env >> /app/src/config/env/.production.env

RUN yarn
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD ["yarn", "start"]