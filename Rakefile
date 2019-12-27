# frozen_string_literal: true

require 'dotenv/tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--format documentation'
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = [
    '--auto-correct',
    '--color',
    '--disable-uncorrectable',
    '--display-cop-names'
  ]
end

task :play do
  ruby 'bin/run.rb'
end

task :pry do
  ruby 'bin/pry.rb'
end

task default: %i[spec rubocop]
