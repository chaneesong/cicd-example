FROM node:18

RUN mkdir -p /app
WORKDIR /app
COPY . /app/

RUN rm yarn.lock || true
RUN rm package-lock.json || true
RUN yarn
RUN yarn build

ENV HOST 0.0.0.0
EXPOSE 3000

CMD ["mkdir", "-p", "/app/dist/config/env", "&&", "yarn", "start"]