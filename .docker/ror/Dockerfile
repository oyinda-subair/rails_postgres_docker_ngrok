FROM ruby:3.2.2

# Register Yarn package source.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install additional packages.
RUN apt update -qq
RUN apt install -y postgresql-client nodejs yarn

# Prepare working directory.
WORKDIR /ror
COPY . /ror
RUN gem install bundler
RUN bundle install

# Configure endpoint.
COPY ./.docker/ror/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start app server.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

# docker run -it -e NGROK_AUTHTOKEN=2Pp6aUl281Y9Luepv1lhOZzW3Eq_3GRXCsWe3e3QXNq2KoGq9 ngrok/ngrok http 80 --domain=oyinda.ngrok.app
