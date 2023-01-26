FROM ruby:3.1.1-slim
COPY . .
RUN #gem install bundler@2.3.7
RUN bundle
EXPOSE 3000
RUN bin/dev