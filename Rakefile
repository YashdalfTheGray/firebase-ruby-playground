# frozen_string_literal: true

require 'dotenv/tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yard'

require 'fileutils'
require 'os'

def alias_task(name, old_name)
  t = Rake::Task[old_name]
  desc t.full_comment if t.full_comment
  task name, *t.arg_names do |_, args|
    # values_at is broken on Rake::TaskArguments
    args = t.arg_names.map { |a| args[a] }
    t.invoke(*args)
  end
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = '--format documentation --require spec_helper'
end

alias_task :test, :spec

RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = [
    '--auto-correct',
    '--color',
    '--disable-uncorrectable',
    '--display-cop-names',
  ]
end

YARD::Rake::YardocTask.new

task :play do
  ruby 'bin/run.rb'
end

task :pry do
  ruby 'bin/pry.rb'
end

task :open_coverage do
  sh %( #{OS.open_file_command} "coverage/index.html" )
end

task :open_docs do
  sh %( #{OS.open_file_command} "doc/index.html" )
end

task default: %i[spec rubocop yard]
