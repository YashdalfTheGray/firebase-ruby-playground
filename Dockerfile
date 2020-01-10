FROM ruby:2.6-buster

# Set up a firebase project ID arg
ARG project_id

# Create some directories
RUN mkdir /usr/app
RUN mkdir /usr/creds

# Set up some ENV variables
ENV PROJECT_ID=${project_id} GOOGLE_APPLICATION_CREDENTIALS=/usr/creds/firebase.json

# Copy in the application code
COPY . /usr/app/
WORKDIR /usr/app/

# Install bundler and dependencies
RUN gem install bundler && bundle install

# Launch into the playground in pry mode
CMD [ "bundle", "exec", "rake", "pry" ]
