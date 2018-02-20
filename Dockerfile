FROM ruby:2.5
MAINTAINER Adrian Lara - adrianblara@gmail.com

RUN apt-get update && apt-get install -y build-essential nodejs

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server"]
