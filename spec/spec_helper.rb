# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end

require 'dotenv'
Dotenv.load

require 'simplecov-material'
require 'simplecov-console'
require 'simplecov-lcov'
require 'rspec/expectations'

SimpleCov::Formatter::LcovFormatter.config do |c|
  c.report_with_single_file = true
  c.single_report_path = 'coverage/lcov/lcov.info'
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [
    SimpleCov::Formatter::MaterialFormatter,
    SimpleCov::Formatter::Console,
    SimpleCov::Formatter::LcovFormatter,
  ]
)

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
    mocks.verify_partial_doubles = true
  end
end

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

RSpec::Matchers.define :happen_after do |point_of_time|
  match do |test_time|
    time_unix = point_of_time.strftime('%Q').to_i
    test_unix = test_time.strftime('%Q').to_i
    test_unix > time_unix
  end

  failure_message do |test_time|
    "expected #{test_time} to happen after #{point_of_time}"
  end

  failure_message_when_negated do |test_time|
    "expected #{test_time} not to happen after #{point_of_time}"
  end
end
