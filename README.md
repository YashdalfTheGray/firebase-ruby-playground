[![Build Status](https://github.com/YashdalfTheGray/firebase-ruby-playground/workflows/Build/badge.svg)](https://github.com/YashdalfTheGray/firebase-ruby-playground/actions)
[![Coverage Status](https://coveralls.io/repos/github/YashdalfTheGray/firebase-ruby-playground/badge.svg?branch=master)](https://coveralls.io/github/YashdalfTheGray/firebase-ruby-playground?branch=master)

# firebase-ruby-playground

A ruby playground to experiment with the ruby wrapper for the FIrebase API.

## Installation

Pull the repository down and run `bundle install` to get all the dependencies. If you don't have `bundle`, run `gem install bundler`. This project uses Ruby 2.6.x.

## Running

First, you're going to need a firebase account and a firestore created for this repository. You're then going to want to create a file called `.env` in the project root that will store the firesbase project ID. The format of the .env file is below.

```
PROJECT_ID=<project_id>
GOOGLE_APPLICATION_CREDENTIALS=<path_to_google_creds_json_file>
```

The path for the second key there, `GOOGLE_APPLICATION_CREDENTIALS`, can be obtained by following the the "Firestore Ruby Getting Started" article that's linked in the references.

To start the playground, just run `bundle exec rake play` or if you have rake installed, run `rake play`.

## References

- [Firestore Ruby Getting Started](https://firebase.google.com/docs/firestore/quickstart)
- [Faker API](https://github.com/faker-ruby/faker)
- [RSpec docs](https://relishapp.com/rspec/)
- [Simplecov](https://github.com/colszowka/simplecov)
- [Coveralls Github action](https://github.com/marketplace/actions/coveralls-github-action)
