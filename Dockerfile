FROM ruby:2.7.1-alpine

RUN apk add --update --no-cache \
    build-base \
    git \
    imagemagick \
    nodejs \
    npm \
    postgresql-dev \
    tzdata

RUN gem install bundler

WORKDIR /app

COPY . /app/

RUN bundle install --path=.bundle \
 && rm -rf /usr/local/bundle/cache/*.gem \
 && find /usr/local/bundle/gems/ -name "*.c" -delete \
 && find /usr/local/bundle/gems/ -name "*.o" -delete

RUN npm install -g yarn && yarn install

RUN cp .env.example .env
