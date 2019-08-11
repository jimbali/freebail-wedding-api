FROM ruby:2.6-alpine

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
RUN gem install bundler --without development test
RUN bundle install

COPY . /app
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]