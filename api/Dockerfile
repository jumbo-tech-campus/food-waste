FROM ruby:2.6

# Installation of dependencies
RUN apt-get update && apt-get install -y apt-utils curl build-essential
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

RUN apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log

WORKDIR /app

ADD Gemfile* ./
RUN gem install bundler -v 2.0.2
RUN bundle install

ADD . .

RUN bundle exec rails assets:clobber
RUN bundle exec rails assets:precompile

CMD bash -c "rm -f /app/tmp/pids/server.pid; bundle exec rails s -p 3001 -b '0.0.0.0'"
