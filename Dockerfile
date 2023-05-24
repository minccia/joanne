FROM ruby:3.2.0 AS base

WORKDIR /app
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

FROM base AS dev

EXPOSE 3000
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0"]