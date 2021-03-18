FROM ruby:latest

RUN apt-get update && apt-get install -y nodejs postgresql-client

# install yarn for rails 6
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get remove yarn && apt-get remove cmdtest
RUN apt-get update && apt-get install yarn

WORKDIR /app
COPY ./app/Gemfile /app/Gemfile
COPY ./app/Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY ./app /app

# Add a script to be executed everytime the container starts
COPY ./entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "s", "-b", "0.0.0.0"]