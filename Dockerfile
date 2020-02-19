FROM ruby:2.6.4-alpine

RUN apk add --no-cache --update build-base \
                                linux-headers \
                                git \
                                mysql-dev \
                                nodejs \
                                tzdata \
                                ruby-dev

WORKDIR /app
ADD Gemfile /app
ADD Gemfile.lock /app
RUN gem install bundler
RUN bundle install --without development test

COPY . /app
EXPOSE 3000

CMD ["bundle", "exec", "bin/rails", "server", "-b", "0.0.0.0"]
