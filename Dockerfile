FROM ruby:2.5.0
LABEL maintainer "tocomi tocomi@wish.ocn.ne.jp"

RUN mkdir /tekkaba
WORKDIR /tekkaba

RUN apt-get update; \
    apt-get install -y \
        libssl1.0-dev curl apt-transport-https

# install nodejs, yarn for webpacker
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
    curl -sL https://deb.nodesource.com/setup_9.x | bash -; \
    apt-get update; \
    apt-get install -y yarn nodejs

COPY . /tekkaba

RUN bundle install
RUN yarn install

RUN chmod u+x bin/rails
RUN bin/rails db:migrate

EXPOSE 13000

CMD [ "unicorn", "-E", "development", "-c", "config/unicorn.rb" ]
