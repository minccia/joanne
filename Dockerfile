FROM ruby:3.2.0 AS base

ENV NODE_VERSION 18
WORKDIR /app
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - ; \
    apt-get update; \ 
    apt-get install -y nodejs; \
    npm install -g yarn; \
    rm -rf /var/lib/apt/lists/*

FROM base AS dev

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
EXPOSE 3000
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0"]