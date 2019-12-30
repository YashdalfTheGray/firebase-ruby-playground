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
end
