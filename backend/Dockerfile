FROM debian:12-slim

ADD requirements.txt /requirements.txt

RUN apt-get update && \
    xargs -a requirements.txt apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

ADD https://www.redmine.org/releases/redmine-5.1.3.tar.gz /tmp/redmine.tar.gz

RUN tar -xzf /tmp/redmine.tar.gz -C /usr/src/ && \
    mv /usr/src/redmine-5.1.3 /usr/src/redmine && \
    rm /tmp/redmine.tar.gz

COPY config/database.yml /usr/src/redmine/config/database.yml

WORKDIR /usr/src/redmine

RUN bundle install

RUN bundle exec rake generate_secret_token

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
