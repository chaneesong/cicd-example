FROM node:18

RUN mkdir -p /home/server
WORKDIR /home/server
COPY . /home/server/

RUN rm yarn.lock || true
RUN rm package-lock.json || true
RUN mkdir -p /home/server/src/config/env && touch /home/server/src/config/env/.production.env
RUN --mount=type=secret,id=nest_env,target=/home/server/config/env/.production.env

RUN yarn
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD ["yarn", "start"]