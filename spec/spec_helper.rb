# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'dotenv'
Dotenv.load

require 'simplecov-material'
require 'simplecov-console'
require 'rspec/expectations'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::MaterialFormatter,
    SimpleCov::Formatter::Console,
  ]
)

RSpec::Matchers.define :have_length do |length|
  match do |list|
    list.length == length
  end

  failure_message do
    "given list was expected to have length #{length}"
  end

  failure_message_when_negated do
    "given list was not expected to have length #{length}"
  end
end
