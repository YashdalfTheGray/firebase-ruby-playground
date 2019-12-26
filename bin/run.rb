# frozen_string_literal: true

require 'dotenv'
Dotenv.load

require_relative '../lib/playground/firebase_playground'

firebase_config = {
  project_id: ENV['PROJECT_ID']
}

# playground = Playground::FirebasePlayground.new firebase_config

puts firebase_config

puts 'run complete!'
