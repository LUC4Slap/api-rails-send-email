FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y postgresql-client
# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler --no-document
RUN bundle install

COPY . .

EXPOSE 3000

# Start the main process.
CMD ["rails", "s", "-b", "0.0.0.0"]