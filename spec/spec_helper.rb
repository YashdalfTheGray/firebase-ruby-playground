# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require 'simplecov'
require 'simplecov-material'
require 'simplecov-console'
require 'rspec/expectations'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::HTMLFormatter,
    SimpleCov::Formatter::MaterialFormatter,
    SimpleCov::Formatter::Console
  ]
)

SimpleCov.start

RSpec::Matchers.define :have_length do |length|
  match do |list|
    list.length == length
  end
end
