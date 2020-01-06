# frozen_string_literal: true

require 'dotenv/tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--format documentation --require spec_helper'
end

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = [
    '--auto-correct',
    '--color',
    '--disable-uncorrectable',
    '--display-cop-names',
  ]
end

task :play do
  ruby 'bin/run.rb'
end

task :pry do
  ruby 'bin/pry.rb'
end

task :open_coverage do
  sh %( #{OS.open_file_command} "coverage/index.html" )
end

task default: %i[spec rubocop]
