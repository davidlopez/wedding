# syntax = docker/dockerfile:1

# Make sure it matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.1.1
FROM ruby:$RUBY_VERSION-slim as base

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_WITHOUT="development"


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages need to build gems and node modules
RUN apt-get update -qq && \
    apt-get install -y build-essential curl default-libmysqlclient-dev git libpq-dev libvips node-gyp pkg-config python-is-python3 redis

# Install JavaScript dependencies
ARG NODE_VERSION=19.5.0
ARG YARN_VERSION=1.22.19
ENV VOLTA_HOME="/usr/local"
RUN curl https://get.volta.sh | bash && \
    volta install node@$NODE_VERSION yarn@$YARN_VERSION

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    bundle exec bootsnap precompile --gemfile


# Install node modules
COPY package.json yarn.lock ./
RUN yarn install

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 SECRET_KEY_BASE=dummy ./bin/rails assets:precompile


# Final stage for app image
FROM base

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y default-mysql-client libsqlite3-0 libvips postgresql-client redis && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Copy built artifacts: gems, application
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]